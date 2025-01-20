@interface _ANECompilerAnalytics
+ (id)new;
+ (id)objectWithBuffer:(id)a3;
- (BOOL)getBOOLDataValueAt:(unint64_t)a3;
- (BOOL)populateAnalytics;
- (NSArray)procedureAnalytics;
- (NSData)analyticsBuffer;
- (NSNumber)bufferSizeInBytes;
- (_ANECompilerAnalytics)init;
- (_ANECompilerAnalytics)initWithBuffer:(id)a3;
- (_AnalyticsData)dataInfoAt:(unint64_t)a3;
- (_AnalyticsGroupInfo)groupInfoAt:(unint64_t)a3;
- (_AnalyticsLayerInfo)layerInfoAt:(unint64_t)a3;
- (_AnalyticsProcedureInfo)procedureInfoAt:(unint64_t)a3;
- (_AnalyticsTaskInfo)taskInfoAt:(unint64_t)a3;
- (id)description;
- (id)serialize;
- (id)stringForAnalyticsType:(unsigned int)a3;
- (unint64_t)getDataValueAt:(unint64_t)a3;
- (unint64_t)offsetTableAt:(unint64_t)a3 count:(unsigned int)a4;
- (void)setProcedureAnalytics:(id)a3;
@end

@implementation _ANECompilerAnalytics

+ (id)objectWithBuffer:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithBuffer:v4];

  return v5;
}

+ (id)new
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferSizeInBytes, 0);
  objc_storeStrong((id *)&self->_analyticsBuffer, 0);

  objc_storeStrong((id *)&self->_procedureAnalytics, 0);
}

- (NSNumber)bufferSizeInBytes
{
  return self->_bufferSizeInBytes;
}

- (NSData)analyticsBuffer
{
  return self->_analyticsBuffer;
}

- (void)setProcedureAnalytics:(id)a3
{
}

- (NSArray)procedureAnalytics
{
  return self->_procedureAnalytics;
}

- (_ANECompilerAnalytics)initWithBuffer:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_analyticsBuffer, a3);
    objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v5, "length"));
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    bufferSizeInBytes = self->_bufferSizeInBytes;
    self->_bufferSizeInBytes = v6;

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)serialize
{
  v2 = [(_ANECompilerAnalytics *)self procedureAnalytics];
  v3 = [v2 firstObject];
  id v4 = [v3 serialize];

  return v4;
}

- (BOOL)populateAnalytics
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  v3 = getenv("ESPRESSO_VERBOSE_ANE_ANALYTICS_PRINTING");
  id v4 = [(_ANECompilerAnalytics *)self procedureInfoAt:0];
  v75 = v4;
  if (v4)
  {
    if (v3)
    {
      v6 = Espresso::espresso_os_log_subsystem((Espresso *)v4, v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1920CB000, v6, OS_LOG_TYPE_DEBUG, "== Network Analytics ==", buf, 2u);
      }
    }
    v7 = [(_ANECompilerAnalytics *)self offsetTableAt:v75->var7 count:0];
    os_log_t log = (os_log_t)[MEMORY[0x1E4F1CC08] mutableCopy];
    v8 = (Espresso *)[@"unknown" mutableCopy];
    v72 = v8;
    if (v75->var6)
    {
      uint64_t v10 = 0;
      while (1)
      {
        v11 = [(_ANECompilerAnalytics *)self dataInfoAt:v7[v10]];
        v13 = v11;
        if (!v11) {
          break;
        }
        if (v11->var0 == 15)
        {
          id v14 = [(_ANECompilerAnalytics *)self analyticsBuffer];
          uint64_t v15 = [v14 bytes];

          v16 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v15 + v7[v10] + 8 length:v13->var1];
          v17 = (void *)[[NSString alloc] initWithData:v16 encoding:4];
          uint64_t v18 = [v17 mutableCopy];

          v72 = (void *)v18;
        }
        if (v3)
        {
          v19 = Espresso::espresso_os_log_subsystem((Espresso *)v11, v12);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            unsigned int var1 = v13->var1;
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v84 = var1;
            _os_log_debug_impl(&dword_1920CB000, v19, OS_LOG_TYPE_DEBUG, "Data %u", buf, 8u);
          }
        }
        uint64_t var0 = v13->var0;
        unint64_t v21 = [(_ANECompilerAnalytics *)self getDataValueAt:v7[v10]];
        v22 = [NSNumber numberWithLongLong:v21];
        v23 = [(_ANECompilerAnalytics *)self stringForAnalyticsType:var0];
        [log setObject:v22 forKeyedSubscript:v23];

        if (++v10 >= (unint64_t)v75->var6) {
          goto LABEL_16;
        }
      }
      v71 = Espresso::espresso_os_log_subsystem(0, v12);
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v84 = v10;
        _os_log_debug_impl(&dword_1920CB000, v71, OS_LOG_TYPE_DEBUG, "populateAnalytics failed to read procedure level analytics at index %u", buf, 8u);
      }
      BOOL v64 = 0;
    }
    else
    {
LABEL_16:
      if (v3)
      {
        v25 = Espresso::espresso_os_log_subsystem(v8, v9);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1920CB000, v25, OS_LOG_TYPE_DEBUG, "== Layer Analytics ==", buf, 2u);
        }
      }
      v70 = [(_ANECompilerAnalytics *)self offsetTableAt:v75->var5 count:0];
      v26 = (Espresso *)[MEMORY[0x1E4F1CBF0] mutableCopy];
      v71 = v26;
      if (v75->var4)
      {
        uint64_t v74 = 0;
        *(void *)&long long v28 = 136315394;
        long long v69 = v28;
        while (1)
        {
          if (v3)
          {
            v29 = Espresso::espresso_os_log_subsystem(v26, v27);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v84 = v74;
              _os_log_debug_impl(&dword_1920CB000, v29, OS_LOG_TYPE_DEBUG, "Group # %u ", buf, 8u);
            }
          }
          v30 = -[_ANECompilerAnalytics groupInfoAt:](self, "groupInfoAt:", v70[v74], v69);
          v31 = v30;
          if (!v30) {
            break;
          }
          v32 = [(_ANECompilerAnalytics *)self offsetTableAt:v30->var1 count:0];
          if (!v32) {
            break;
          }
          v78 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
          v79 = v31;
          if (v31->var0)
          {
            unint64_t v33 = 0;
            do
            {
              v34 = [(_ANECompilerAnalytics *)self layerInfoAt:v32[v33]];
              v36 = v34;
              if (v3)
              {
                v37 = Espresso::espresso_os_log_subsystem((Espresso *)v34, v35);
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                {
                  double var2 = v36->var2;
                  *(_DWORD *)buf = v69;
                  *(void *)v84 = v36;
                  *(_WORD *)&v84[8] = 2048;
                  *(double *)&v84[10] = var2;
                  _os_log_debug_impl(&dword_1920CB000, v37, OS_LOG_TYPE_DEBUG, "  Layer Name: %s Weight: %f", buf, 0x16u);
                }
              }
              v38 = [NSString stringWithUTF8String:v36];
              *(float *)&double v39 = v36->var2;
              v40 = [NSNumber numberWithFloat:v39];
              v41 = +[_ANEAnalyticsLayer objectWithName:v38 weight:v40];

              [v78 addObject:v41];
              ++v33;
              v31 = v79;
            }
            while (v33 < v79->var0);
          }
          v76 = [(_ANECompilerAnalytics *)self offsetTableAt:v31->var3 count:0];
          v77 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
          if (v31->var2)
          {
            uint64_t v43 = 0;
            while (1)
            {
              v44 = [(_ANECompilerAnalytics *)self taskInfoAt:v76[v43]];
              v45 = [(_ANECompilerAnalytics *)self offsetTableAt:v44->var1 count:0];
              v47 = v45;
              if (v3)
              {
                v48 = Espresso::espresso_os_log_subsystem((Espresso *)v45, v46);
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v84 = v43;
                  _os_log_debug_impl(&dword_1920CB000, v48, OS_LOG_TYPE_DEBUG, "  Task %u ", buf, 8u);
                }
              }
              v49 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
              if (v44->var0) {
                break;
              }
LABEL_51:
              v61 = +[_ANEAnalyticsTask objectWithMetrics:v49];
              [v77 addObject:v61];

              if (++v43 >= (unint64_t)v79->var2) {
                goto LABEL_52;
              }
            }
            uint64_t v50 = 0;
            while (2)
            {
              v51 = [(_ANECompilerAnalytics *)self dataInfoAt:v47[v50]];
              unint64_t v52 = v47[v50];
              if (v51->var0 == 11)
              {
                unint64_t v53 = [(_ANECompilerAnalytics *)self getBOOLDataValueAt:v52];
                unint64_t v55 = v53;
                if (!v3) {
                  goto LABEL_50;
                }
              }
              else
              {
                unint64_t v53 = [(_ANECompilerAnalytics *)self getDataValueAt:v52];
                unint64_t v55 = v53;
                if (!v3) {
                  goto LABEL_50;
                }
              }
              v56 = Espresso::espresso_os_log_subsystem((Espresso *)v53, v54);
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
              {
                unsigned int v60 = v51->var1;
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v84 = v60;
                *(_WORD *)&v84[4] = 2048;
                *(void *)&v84[6] = v55;
                _os_log_debug_impl(&dword_1920CB000, v56, OS_LOG_TYPE_DEBUG, "  Size: %u \t Value %llu  ", buf, 0x12u);
              }

LABEL_50:
              v57 = [(_ANECompilerAnalytics *)self stringForAnalyticsType:v51->var0];
              v58 = [NSNumber numberWithLongLong:v55];
              v81 = v57;
              v82 = v58;
              v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
              [v49 addEntriesFromDictionary:v59];

              if (++v50 >= (unint64_t)v44->var0) {
                goto LABEL_51;
              }
              continue;
            }
          }
LABEL_52:
          v62 = [NSNumber numberWithInt:v74];
          v63 = +[_ANEAnalyticsGroup objectWithID:v62 layers:v78 tasks:v77];

          [v71 addObject:v63];
          if (++v74 >= (unint64_t)v75->var4) {
            goto LABEL_58;
          }
        }
        BOOL v64 = 0;
      }
      else
      {
LABEL_58:
        BOOL v64 = 1;
      }
      uint64_t v65 = +[_ANEAnalyticsProcedure objectWithGroups:v71 procedureMetrics:log indentifier:v72];
      v66 = (void *)v65;
      if (!v65) {
        BOOL v64 = 0;
      }
      uint64_t v80 = v65;
      v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
      [(_ANECompilerAnalytics *)self setProcedureAnalytics:v67];
    }
  }
  else
  {
    if (!v3) {
      return 0;
    }
    Espresso::espresso_os_log_subsystem(0, v5);
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1920CB000, log, OS_LOG_TYPE_DEBUG, "No procedure found", buf, 2u);
    }
    BOOL v64 = 0;
  }

  return v64;
}

- (_ANECompilerAnalytics)init
{
  return 0;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(_ANECompilerAnalytics *)self analyticsBuffer];
  v7 = [v6 description];
  v8 = [(_ANECompilerAnalytics *)self bufferSizeInBytes];
  v9 = [v3 stringWithFormat:@"%@: { analyticsBuffer={%@} : bufferSizeInBytes=%llu }", v5, v7, objc_msgSend(v8, "unsignedLongLongValue")];

  return v9;
}

- (BOOL)getBOOLDataValueAt:(unint64_t)a3
{
  id v4 = [(_ANECompilerAnalytics *)self analyticsBuffer];
  uint64_t v5 = [v4 bytes];

  return *(unsigned char *)(v5 + a3 + 8) & 1;
}

- (unint64_t)getDataValueAt:(unint64_t)a3
{
  id v4 = [(_ANECompilerAnalytics *)self analyticsBuffer];
  uint64_t v5 = [v4 bytes];

  return *(void *)(v5 + a3 + 8);
}

- (_AnalyticsData)dataInfoAt:(unint64_t)a3
{
  uint64_t v5 = [(_ANECompilerAnalytics *)self bufferSizeInBytes];
  unint64_t v6 = [v5 unsignedLongValue];

  if (a3 + 8 > v6) {
    return 0;
  }
  id v8 = [(_ANECompilerAnalytics *)self analyticsBuffer];
  uint64_t v9 = [v8 bytes];

  return (_AnalyticsData *)(v9 + a3);
}

- (_AnalyticsTaskInfo)taskInfoAt:(unint64_t)a3
{
  uint64_t v5 = [(_ANECompilerAnalytics *)self bufferSizeInBytes];
  unint64_t v6 = [v5 unsignedLongValue];

  if (a3 + 16 > v6) {
    return 0;
  }
  id v8 = [(_ANECompilerAnalytics *)self analyticsBuffer];
  uint64_t v9 = [v8 bytes];

  return (_AnalyticsTaskInfo *)(v9 + a3);
}

- (_AnalyticsLayerInfo)layerInfoAt:(unint64_t)a3
{
  uint64_t v5 = [(_ANECompilerAnalytics *)self bufferSizeInBytes];
  unint64_t v6 = [v5 unsignedLongValue];

  if (a3 + 132 > v6) {
    return 0;
  }
  id v8 = [(_ANECompilerAnalytics *)self analyticsBuffer];
  uint64_t v9 = [v8 bytes];

  return (_AnalyticsLayerInfo *)(v9 + a3);
}

- (_AnalyticsGroupInfo)groupInfoAt:(unint64_t)a3
{
  uint64_t v5 = [(_ANECompilerAnalytics *)self bufferSizeInBytes];
  unint64_t v6 = [v5 unsignedLongValue];

  if (a3 + 32 > v6) {
    return 0;
  }
  id v8 = [(_ANECompilerAnalytics *)self analyticsBuffer];
  uint64_t v9 = [v8 bytes];

  return (_AnalyticsGroupInfo *)(v9 + a3);
}

- (_AnalyticsProcedureInfo)procedureInfoAt:(unint64_t)a3
{
  uint64_t v5 = [(_ANECompilerAnalytics *)self bufferSizeInBytes];
  unint64_t v6 = [v5 unsignedLongValue];

  if (a3 + 48 > v6) {
    return 0;
  }
  id v8 = [(_ANECompilerAnalytics *)self analyticsBuffer];
  uint64_t v9 = [v8 bytes];

  return (_AnalyticsProcedureInfo *)(v9 + a3);
}

- (unint64_t)offsetTableAt:(unint64_t)a3 count:(unsigned int)a4
{
  v7 = [(_ANECompilerAnalytics *)self bufferSizeInBytes];
  unint64_t v8 = [v7 unsignedLongValue];

  if (a3 + 8 * a4 > v8) {
    return 0;
  }
  id v10 = [(_ANECompilerAnalytics *)self analyticsBuffer];
  uint64_t v11 = [v10 bytes];

  return (unint64_t *)(v11 + a3);
}

- (id)stringForAnalyticsType:(unsigned int)a3
{
  if (a3 > 0x10) {
    return @"Invalid";
  }
  else {
    return (id)*((void *)&off_1E5747F00 + a3);
  }
}

@end