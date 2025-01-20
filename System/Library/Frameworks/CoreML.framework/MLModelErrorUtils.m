@interface MLModelErrorUtils
+ (id)IOErrorWithFormat:(id)a3;
+ (id)customLayerErrorWithUnderlyingError:(id)a3 withFormat:(id)a4;
+ (id)errorWithCode:(int64_t)a3 format:(id)a4;
+ (id)errorWithCode:(int64_t)a3 format:(id)a4 args:(char *)a5;
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 format:(id)a5;
+ (id)errorWithIntegerCode:(int64_t)a3 underlyingError:(id)a4 format:(id)a5 args:(char *)a6;
+ (id)featureTypeErrorWithFormat:(id)a3;
+ (id)genericErrorWithFormat:(id)a3;
+ (id)modelDecryptionErrorWithUnderlyingError:(id)a3 format:(id)a4;
+ (id)modelDecryptionKeyFetchErrorWithUnderlyingError:(id)a3 format:(id)a4;
+ (id)modelEncryptionErrorWithUnderlyingError:(id)a3 format:(id)a4;
+ (id)parameterErrorWithUnderlyingError:(id)a3 format:(id)a4;
+ (id)programEvaluationErrorWithUnderlyingError:(id)a3 format:(id)a4;
+ (id)programParsingAtLoadErrorWithReason:(int)a3 format:(id)a4;
+ (id)programValidationAtLoadErrorWithReason:(int)a3 format:(id)a4;
+ (id)updateErrorWithFormat:(id)a3;
@end

@implementation MLModelErrorUtils

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 format:(id)a5
{
  v5 = [a1 errorWithCode:a3 underlyingError:a4 format:a5 args:&v8];

  return v5;
}

+ (id)genericErrorWithFormat:(id)a3
{
  v3 = [a1 errorWithCode:0 format:a3 args:&v6];

  return v3;
}

+ (id)errorWithIntegerCode:(int64_t)a3 underlyingError:(id)a4 format:(id)a5 args:(char *)a6
{
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11 = (void *)[[NSString alloc] initWithFormat:v10 arguments:a6];
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v13 = v12;
    if (v11)
    {
      [v12 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F28568]];
    }
    if (v9) {
      goto LABEL_5;
    }
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v9) {
LABEL_5:
    }
      [v13 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreML" code:a3 userInfo:v13];

  return v14;
}

+ (id)errorWithCode:(int64_t)a3 format:(id)a4 args:(char *)a5
{
  return (id)[a1 errorWithIntegerCode:a3 underlyingError:0 format:a4 args:a5];
}

+ (id)programEvaluationErrorWithUnderlyingError:(id)a3 format:(id)a4
{
  v4 = [a1 privateErrorWithCode:60 underlyingError:a3 format:a4 args:&v7];

  return v4;
}

+ (id)modelDecryptionErrorWithUnderlyingError:(id)a3 format:(id)a4
{
  v4 = [a1 errorWithCode:9 underlyingError:a3 format:a4 args:&v7];

  return v4;
}

+ (id)modelDecryptionKeyFetchErrorWithUnderlyingError:(id)a3 format:(id)a4
{
  v4 = [a1 errorWithCode:8 underlyingError:a3 format:a4 args:&v7];

  return v4;
}

+ (id)modelEncryptionErrorWithUnderlyingError:(id)a3 format:(id)a4
{
  v4 = [a1 privateErrorWithCode:50 underlyingError:a3 format:a4 args:&v7];

  return v4;
}

+ (id)parameterErrorWithUnderlyingError:(id)a3 format:(id)a4
{
  v4 = [a1 errorWithCode:7 underlyingError:a3 format:a4 args:&v7];

  return v4;
}

+ (id)customLayerErrorWithUnderlyingError:(id)a3 withFormat:(id)a4
{
  v4 = [a1 errorWithCode:4 underlyingError:a3 format:a4 args:&v7];

  return v4;
}

+ (id)programParsingAtLoadErrorWithReason:(int)a3 format:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v5 errorWithDomain:@"com.apple.CoreML" code:v6 userInfo:0];
  id v9 = [a1 privateErrorWithCode:71 underlyingError:v8 format:v7 args:&v12];

  return v9;
}

+ (id)programValidationAtLoadErrorWithReason:(int)a3 format:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v5 errorWithDomain:@"com.apple.CoreML" code:v6 userInfo:0];
  id v9 = [a1 privateErrorWithCode:70 underlyingError:v8 format:v7 args:&v12];

  return v9;
}

+ (id)IOErrorWithFormat:(id)a3
{
  v3 = [a1 errorWithCode:3 format:a3 args:&v6];

  return v3;
}

+ (id)featureTypeErrorWithFormat:(id)a3
{
  v3 = [a1 errorWithCode:1 format:a3 args:&v6];

  return v3;
}

+ (id)updateErrorWithFormat:(id)a3
{
  v3 = [a1 errorWithCode:6 format:a3 args:&v6];

  return v3;
}

+ (id)errorWithCode:(int64_t)a3 format:(id)a4
{
  v4 = [a1 errorWithCode:a3 underlyingError:0 format:a4 args:&v7];

  return v4;
}

@end