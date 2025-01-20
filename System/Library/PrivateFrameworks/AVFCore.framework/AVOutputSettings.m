@interface AVOutputSettings
+ (BOOL)supportsEmptyOutputSettingsDictionary;
+ (id)_outputSettingsWithOutputSettingsDictionary:(id)a3 mediaType:(id)a4 exceptionReason:(id *)a5;
+ (id)defaultOutputSettingsForMediaType:(id)a3;
+ (id)eligibleOutputSettingsDictionaryKeys;
+ (id)outputSettingsWithOutputSettingsDictionary:(id)a3 mediaType:(id)a4;
+ (id)registeredOutputSettingsClasses;
+ (unint64_t)_validateOutputSettingsDictionary:(id)a3 compatibilityDescription:(id *)a4;
+ (unint64_t)validateOutputSettingsDictionary:(id)a3;
- (AVOutputSettings)init;
- (AVOutputSettings)initWithOutputSettingsDictionary:(id)a3 exceptionReason:(id *)a4;
- (BOOL)canFullySpecifyOutputFormatReturningReason:(id *)a3;
- (BOOL)encoderIsAvailableOnCurrentSystemReturningError:(id *)a3;
- (BOOL)validateUsingOutputSettingsValidator:(id)a3 reason:(id *)a4;
- (BOOL)willYieldCompressedSamples;
- (NSDictionary)outputSettingsDictionary;
- (NSSet)compatibleMediaTypes;
- (id)description;
- (void)dealloc;
@end

@implementation AVOutputSettings

+ (id)_outputSettingsWithOutputSettingsDictionary:(id)a3 mediaType:(id)a4 exceptionReason:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v23 = a1;
    v29 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, @"invalid parameter not satisfying: %s", v24, v25, v26, v27, v28, (uint64_t)"outputSettingsDictionary != nil"), 0 reason userInfo];
    objc_exception_throw(v29);
  }
  v34 = 0;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v9 = (void *)[a1 registeredOutputSettingsClasses];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    char v12 = 0;
    uint64_t v13 = *(void *)v31;
    v14 = @"Output settings dictionary does not contain any recognized keys";
LABEL_4:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v31 != v13) {
        objc_enumerationMutation(v9);
      }
      v16 = *(void **)(*((void *)&v30 + 1) + 8 * v15);
      char v17 = [v16 _validateOutputSettingsDictionary:a3 compatibilityDescription:&v34];
      if ((v17 & 1) == 0) {
        goto LABEL_14;
      }
      if ((v12 & 1) == 0) {
        v14 = v34;
      }
      if ((v17 & 2) == 0)
      {
        v18 = (void *)[v16 _outputSettingsWithOutputSettingsDictionary:a3 mediaType:a4 exceptionReason:&v34];
        if (!v18)
        {
          char v12 = 1;
          v14 = v34;
          goto LABEL_14;
        }
        v19 = v18;
        if (objc_msgSend((id)objc_msgSend(v18, "compatibleMediaTypes"), "containsObject:", a4))
        {
          v14 = v34;
          if (!a5) {
            return v19;
          }
          goto LABEL_21;
        }
      }
      char v12 = 1;
LABEL_14:
      if (v11 == ++v15)
      {
        uint64_t v20 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
        uint64_t v11 = v20;
        if (v20) {
          goto LABEL_4;
        }
        v19 = 0;
        if (a5) {
          goto LABEL_21;
        }
        return v19;
      }
    }
  }
  v19 = 0;
  v14 = @"Output settings dictionary does not contain any recognized keys";
  if (a5) {
LABEL_21:
  }
    *a5 = v14;
  return v19;
}

+ (unint64_t)_validateOutputSettingsDictionary:(id)a3 compatibilityDescription:(id *)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(a3, "allKeys"));
  v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithSet:", objc_msgSend(a1, "eligibleOutputSettingsDictionaryKeys"));
  if ([a1 supportsEmptyOutputSettingsDictionary] && !objc_msgSend(v6, "count"))
  {
    uint64_t v10 = @"Output settings dictionary is empty and valid";
    unint64_t v9 = 1;
    if (!a4) {
      return v9;
    }
    goto LABEL_9;
  }
  [v7 intersectSet:v6];
  unint64_t v8 = [v7 count];
  unint64_t v9 = v8 != 0;
  if (v8) {
    uint64_t v10 = @"Output settings dictionary is valid";
  }
  else {
    uint64_t v10 = 0;
  }
  if (v8 < [v6 count])
  {
    v9 |= 2uLL;
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA80] setWithSet:v6];
    [v11 minusSet:v7];
    uint64_t v10 = (__CFString *)[NSString stringWithFormat:@"Output settings dictionary contains one or more invalid keys: %@", objc_msgSend((id)objc_msgSend(v11, "allObjects"), "componentsJoinedByString:", @", ")];
  }
  if (a4) {
LABEL_9:
  }
    *a4 = v10;
  return v9;
}

+ (BOOL)supportsEmptyOutputSettingsDictionary
{
  return 0;
}

- (AVOutputSettings)initWithOutputSettingsDictionary:(id)a3 exceptionReason:(id *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVOutputSettings;
  v6 = [(AVOutputSettings *)&v9 init];
  uint64_t v7 = objc_opt_class();
  AVRequireConcreteObject(v6, a2, v7);
  if (v6) {
    v6->_outputSettingsDictionary = (NSDictionary *)objc_msgSend(a3, "copyWithZone:", -[AVOutputSettings zone](v6, "zone"));
  }
  return v6;
}

- (NSDictionary)outputSettingsDictionary
{
  return self->_outputSettingsDictionary;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVOutputSettings;
  [(AVOutputSettings *)&v3 dealloc];
}

+ (id)registeredOutputSettingsClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

+ (id)eligibleOutputSettingsDictionaryKeys
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA80] set];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = objc_msgSend(a1, "registeredOutputSettingsClasses", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "unionSet:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "eligibleOutputSettingsDictionaryKeys"));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

+ (unint64_t)validateOutputSettingsDictionary:(id)a3
{
  return [a1 _validateOutputSettingsDictionary:a3 compatibilityDescription:0];
}

+ (id)outputSettingsWithOutputSettingsDictionary:(id)a3 mediaType:(id)a4
{
  uint64_t v14 = 0;
  id result = (id)[a1 _outputSettingsWithOutputSettingsDictionary:a3 mediaType:a4 exceptionReason:&v14];
  if (!result)
  {
    long long v12 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, v14, v7, v8, v9, v10, v11, v13), 0);
    objc_exception_throw(v12);
  }
  return result;
}

+ (id)defaultOutputSettingsForMediaType:(id)a3
{
  if ([a3 isEqualToString:@"soun"])
  {
    return +[AVAudioOutputSettings defaultAudioOutputSettings];
  }
  else if (([a3 isEqualToString:@"vide"] & 1) != 0 {
         || [a3 isEqualToString:@"auxv"])
  }
  {
    return +[AVVideoOutputSettings defaultVideoOutputSettings];
  }
  else
  {
    return 0;
  }
}

- (AVOutputSettings)init
{
  return [(AVOutputSettings *)self initWithOutputSettingsDictionary:0 exceptionReason:0];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, outputSettingsDictionary=%@>", NSStringFromClass(v4), self, -[AVOutputSettings outputSettingsDictionary](self, "outputSettingsDictionary")];
}

- (NSSet)compatibleMediaTypes
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (BOOL)willYieldCompressedSamples
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (BOOL)canFullySpecifyOutputFormatReturningReason:(id *)a3
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

- (BOOL)validateUsingOutputSettingsValidator:(id)a3 reason:(id *)a4
{
  uint64_t v6 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v6);
  return 0;
}

- (BOOL)encoderIsAvailableOnCurrentSystemReturningError:(id *)a3
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

@end