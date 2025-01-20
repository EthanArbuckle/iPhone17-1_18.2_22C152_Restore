@interface PHASEDucker
+ (PHASEDucker)new;
- (BOOL)deactivate;
- (BOOL)isActive;
- (NSSet)sourceGroups;
- (NSSet)targetGroups;
- (NSString)identifier;
- (NSString)uid;
- (PHASECurveType)attackCurve;
- (PHASECurveType)releaseCurve;
- (PHASEDucker)init;
- (PHASEDucker)initWithEngine:(PHASEEngine *)engine sourceGroups:(NSSet *)sourceGroups targetGroups:(NSSet *)targetGroups gain:(double)gain attackTime:(double)attackTime releaseTime:(double)releaseTime attackCurve:(PHASECurveType)attackCurve releaseCurve:(PHASECurveType)releaseCurve;
- (PHASEDucker)initWithEngine:(id)a3 sourceGroups:(id)a4 targetGroups:(id)a5 gain:(double)a6 gainHighFrequency:(double)a7 gainLowFrequency:(double)a8 attackTime:(double)a9 releaseTime:(double)a10 attackCurve:(int64_t)a11 releaseCurve:(int64_t)a12;
- (PHASEDucker)initWithEngine:(id)a3 sourceGroups:(id)a4 targetGroups:(id)a5 gain:(double)a6 lowFrequencyGain:(double)a7 highFrequencyGain:(double)a8 attackTime:(double)a9 releaseTime:(double)a10 attackCurve:(int64_t)a11 releaseCurve:(int64_t)a12;
- (double)attackTime;
- (double)gain;
- (double)gainHighFrequency;
- (double)gainLowFrequency;
- (double)releaseTime;
- (uint64_t)activate;
- (uint64_t)deactivate;
- (void)activate;
- (void)deactivate;
@end

@implementation PHASEDucker

- (PHASEDucker)init
{
  return 0;
}

+ (PHASEDucker)new
{
  return 0;
}

- (PHASEDucker)initWithEngine:(PHASEEngine *)engine sourceGroups:(NSSet *)sourceGroups targetGroups:(NSSet *)targetGroups gain:(double)gain attackTime:(double)attackTime releaseTime:(double)releaseTime attackCurve:(PHASECurveType)attackCurve releaseCurve:(PHASECurveType)releaseCurve
{
  return [(PHASEDucker *)self initWithEngine:engine sourceGroups:sourceGroups targetGroups:targetGroups gain:attackCurve gainHighFrequency:releaseCurve gainLowFrequency:gain attackTime:1.0 releaseTime:1.0 attackCurve:attackTime releaseCurve:releaseTime];
}

- (PHASEDucker)initWithEngine:(id)a3 sourceGroups:(id)a4 targetGroups:(id)a5 gain:(double)a6 lowFrequencyGain:(double)a7 highFrequencyGain:(double)a8 attackTime:(double)a9 releaseTime:(double)a10 attackCurve:(int64_t)a11 releaseCurve:(int64_t)a12
{
  return [(PHASEDucker *)self initWithEngine:a3 sourceGroups:a4 targetGroups:a5 gain:a11 gainHighFrequency:a12 gainLowFrequency:a6 attackTime:a8 releaseTime:a7 attackCurve:a9 releaseCurve:a10];
}

- (PHASEDucker)initWithEngine:(id)a3 sourceGroups:(id)a4 targetGroups:(id)a5 gain:(double)a6 gainHighFrequency:(double)a7 gainLowFrequency:(double)a8 attackTime:(double)a9 releaseTime:(double)a10 attackCurve:(int64_t)a11 releaseCurve:(int64_t)a12
{
  int64_t v69 = a11;
  int64_t v70 = a12;
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v21 = a3;
  id v72 = a4;
  id v71 = a5;
  v81.receiver = self;
  v81.super_class = (Class)PHASEDucker;
  v22 = [(PHASEDucker *)&v81 init];
  if (v22)
  {
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v23 = v72;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v77 objects:v89 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v78;
      while (2)
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v78 != v25) {
            objc_enumerationMutation(v23);
          }
          v27 = *(void **)(*((void *)&v77 + 1) + 8 * i);
          objc_msgSend(v27, "engine", v69, v70);
          id v28 = (id)objc_claimAutoreleasedReturnValue();
          BOOL v29 = v28 == v21;

          if (!v29)
          {
            v62 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v30)
                                                                                                + 432)));
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              id v63 = [v27 identifier];
              uint64_t v64 = [v63 UTF8String];
              *(_DWORD *)buf = 136315650;
              v84 = "PHASEDucker.mm";
              __int16 v85 = 1024;
              int v86 = 107;
              __int16 v87 = 2080;
              uint64_t v88 = v64;
              _os_log_impl(&dword_221E5E000, v62, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Failed to initialize ducker: Group %s is from a different engine instance", buf, 0x1Cu);
            }
LABEL_26:
            v61 = 0;
            goto LABEL_27;
          }
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v77 objects:v89 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }

    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v31 = v71;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v73 objects:v82 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v74;
      while (2)
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v74 != v33) {
            objc_enumerationMutation(v31);
          }
          v35 = *(void **)(*((void *)&v73 + 1) + 8 * j);
          objc_msgSend(v35, "engine", v69, v70);
          id v36 = (id)objc_claimAutoreleasedReturnValue();
          BOOL v37 = v36 == v21;

          if (!v37)
          {
            v65 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v38)
                                                                                                + 432)));
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              id v66 = [v35 identifier];
              uint64_t v67 = [v66 UTF8String];
              *(_DWORD *)buf = 136315650;
              v84 = "PHASEDucker.mm";
              __int16 v85 = 1024;
              int v86 = 118;
              __int16 v87 = 2080;
              uint64_t v88 = v67;
              _os_log_impl(&dword_221E5E000, v65, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Failed to initialize ducker: Group %s is from a different engine instance", buf, 0x1Cu);
            }
            goto LABEL_26;
          }
        }
        uint64_t v32 = [v31 countByEnumeratingWithState:&v73 objects:v82 count:16];
        if (v32) {
          continue;
        }
        break;
      }
    }

    uint64_t v39 = [MEMORY[0x263EFFA08] setWithSet:v23];
    sourceGroups = v22->_sourceGroups;
    v22->_sourceGroups = (NSSet *)v39;

    uint64_t v41 = [MEMORY[0x263EFFA08] setWithSet:v31];
    targetGroups = v22->_targetGroups;
    v22->_targetGroups = (NSSet *)v41;

    v43 = (objc_class *)objc_opt_class();
    v44 = NSStringFromClass(v43);
    v45 = NSStringFromSelector(a2);
    v22->_gain = PHASEGetPropertyBounded<double>(v44, v45, a6, 0.0, 1.0);

    v46 = (objc_class *)objc_opt_class();
    v47 = NSStringFromClass(v46);
    v48 = NSStringFromSelector(a2);
    v22->_gainHighFrequency = PHASEGetPropertyBounded<double>(v47, v48, a7, 0.0, 1.0);

    v49 = (objc_class *)objc_opt_class();
    v50 = NSStringFromClass(v49);
    v51 = NSStringFromSelector(a2);
    v22->_gainLowFrequency = PHASEGetPropertyBounded<double>(v50, v51, a8, 0.0, 1.0);

    v52 = (objc_class *)objc_opt_class();
    v53 = NSStringFromClass(v52);
    v54 = NSStringFromSelector(a2);
    v22->_attackTime = PHASEGetPropertyBounded<double>(v53, v54, a9, 0.0, 1.79769313e308);

    v55 = (objc_class *)objc_opt_class();
    v56 = NSStringFromClass(v55);
    v57 = NSStringFromSelector(a2);
    v22->_releaseTime = PHASEGetPropertyBounded<double>(v56, v57, a10, 0.0, 1.79769313e308);

    objc_storeWeak((id *)&v22->_engine, v21);
    v22->_attackCurve = v69;
    v22->_releaseCurve = v70;
    v58 = [MEMORY[0x263F08C38] UUID];
    uint64_t v59 = [v58 UUIDString];
    identifier = v22->_identifier;
    v22->_identifier = (NSString *)v59;

    v22->_active = 0;
  }
  v61 = v22;
LABEL_27:

  return v61;
}

- (NSSet)sourceGroups
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithSet:self->_sourceGroups];
}

- (NSSet)targetGroups
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithSet:self->_targetGroups];
}

- (void)activate
{
  JUMPOUT(0x223C938A0);
}

- (void)deactivate
{
  JUMPOUT(0x223C938A0);
}

- (BOOL)isActive
{
  return self->_active;
}

- (double)gain
{
  return self->_gain;
}

- (double)attackTime
{
  return self->_attackTime;
}

- (double)releaseTime
{
  return self->_releaseTime;
}

- (PHASECurveType)attackCurve
{
  return self->_attackCurve;
}

- (PHASECurveType)releaseCurve
{
  return self->_releaseCurve;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)gainHighFrequency
{
  return self->_gainHighFrequency;
}

- (double)gainLowFrequency
{
  return self->_gainLowFrequency;
}

- (NSString)uid
{
  return self->_uid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_targetGroups, 0);
  objc_storeStrong((id *)&self->_sourceGroups, 0);

  objc_destroyWeak((id *)&self->_engine);
}

- (uint64_t)activate
{
  return Phase::Controller::GroupManager::StartDuck(*(Phase::Controller::GroupManager **)(a1 + 8), *(PHASEDucker **)(a1 + 16));
}

- (uint64_t)deactivate
{
  return a1;
}

- (BOOL)deactivate
{
  return Phase::Controller::GroupManager::ReleaseDuck(*(Phase::Controller::GroupManager **)(a1 + 8), *(PHASEDucker **)(a1 + 16));
}

@end