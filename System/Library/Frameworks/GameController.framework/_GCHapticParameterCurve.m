@interface _GCHapticParameterCurve
- (NSMutableArray)curve;
- (_GCHapticParameterCurve)initWithHapticCommand:(const void *)a3;
- (void)setCurve:(id)a3;
@end

@implementation _GCHapticParameterCurve

- (_GCHapticParameterCurve)initWithHapticCommand:(const void *)a3
{
  v31.receiver = self;
  v31.super_class = (Class)_GCHapticParameterCurve;
  v4 = [(_GCHapticParameterCurve *)&v31 init];
  if (!v4) {
    return v4;
  }
  uint64_t v5 = +[NSMutableArray array];
  curve = v4->_curve;
  v4->_curve = (NSMutableArray *)v5;

  int v8 = *((_DWORD *)a3 + 8);
  int v9 = *((_DWORD *)a3 + 6);
  unsigned int v10 = *((_DWORD *)a3 + 4);
  if (v9 <= 1019)
  {
    unsigned int v11 = 5000;
    switch(v9)
    {
      case 1000:
        goto LABEL_25;
      case 1001:
        unsigned int v11 = 5001;
        break;
      case 1010:
        unsigned int v11 = 73;
        break;
      case 1011:
        unsigned int v11 = 75;
        break;
      case 1012:
        unsigned int v11 = 72;
        break;
      case 1013:
        unsigned int v11 = 5004;
        break;
      case 1015:
        unsigned int v11 = 5011;
        break;
      default:
        goto LABEL_15;
    }
    goto LABEL_25;
  }
  unsigned int v11 = 0;
  if (v9 <= 2009)
  {
    switch(v9)
    {
      case 1020:
        goto LABEL_25;
      case 2000:
        unsigned int v11 = 5002;
        goto LABEL_25;
      case 2001:
        unsigned int v11 = 5003;
        goto LABEL_25;
    }
LABEL_15:
    unsigned int v11 = *((_DWORD *)a3 + 6);
    if (v9 > 0xFF) {
      unsigned int v11 = 0;
    }
    goto LABEL_25;
  }
  if (v9 > 2011)
  {
    if (v9 == 2012)
    {
      unsigned int v11 = 81;
      goto LABEL_25;
    }
    if (v9 == 2020) {
      goto LABEL_25;
    }
    goto LABEL_15;
  }
  if (v9 == 2010) {
    unsigned int v11 = 79;
  }
  else {
    unsigned int v11 = 80;
  }
LABEL_25:
  uint64_t v12 = (v8 - 1);
  if (v8 != 1)
  {
    v13 = (float *)((char *)a3 + 48);
    *(void *)&long long v7 = 138412290;
    long long v25 = v7;
    do
    {
      float v14 = *(v13 - 2);
      double v15 = *((double *)a3 + 1);
      double v16 = v15 + *(v13 - 3);
      double v17 = v15 + *(v13 - 1);
      v26[0] = v10;
      v26[1] = v11;
      double v27 = v16;
      double v28 = v17;
      double v18 = v14;
      double v19 = *v13;
      double v29 = v18;
      double v30 = v19;
      if (gc_isInternalBuild())
      {
        v22 = getGCHapticsLogger();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = hapticParamCurveSegmentToString(v26);
          *(_DWORD *)buf = v25;
          v33 = v23;
          _os_log_impl(&dword_220998000, v22, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }
      }
      v20 = v4->_curve;
      v21 = +[NSValue valueWithBytes:objCType:](&off_26D2ACCE0, "valueWithBytes:objCType:", v26, "{?=II{?=dddd}}", v25);
      [(NSMutableArray *)v20 addObject:v21];

      v13 += 2;
      --v12;
    }
    while (v12);
  }
  return v4;
}

- (NSMutableArray)curve
{
  return self->_curve;
}

- (void)setCurve:(id)a3
{
}

- (void).cxx_destruct
{
}

@end