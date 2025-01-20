@interface NullCodecConfiguration
+ (BOOL)supportsSecureCoding;
- (NullCodecConfiguration)init;
- (NullCodecConfiguration)initWithCoder:(id)a3;
- (NullCodecConfiguration)initWithCommandLineArgs:(id)a3;
- (float)retrievalCallbackInterval;
- (id)commandLineOptions;
- (void)encodeWithCoder:(id)a3;
- (void)setDefaultValues;
- (void)setRetrievalCallbackInterval:(float)a3;
@end

@implementation NullCodecConfiguration

- (NullCodecConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)NullCodecConfiguration;
  return [(AUPasscodeCodecConfiguration *)&v3 initWithAlgorithmName:@"null"];
}

- (NullCodecConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NullCodecConfiguration;
  v5 = [(AUPasscodeCodecConfiguration *)&v8 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeFloatForKey:@"retrievalCallbackInterval"];
    v5->_retrievalCallbackInterval = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(NullCodecConfiguration *)self retrievalCallbackInterval];
  objc_msgSend(v4, "encodeFloat:forKey:", @"retrievalCallbackInterval");
  v5.receiver = self;
  v5.super_class = (Class)NullCodecConfiguration;
  [(AUPasscodeCodecConfiguration *)&v5 encodeWithCoder:v4];
}

- (void)setDefaultValues
{
  self->_retrievalCallbackInterval = 4.0;
}

- (id)commandLineOptions
{
  v9[1] = *MEMORY[0x263EF8340];
  objc_super v3 = +[AUPasscodeCodecCommandLineOption optionWithSyntax:@"-t [seconds]" description:@"Set the time interval between irrelevant data retrieved handlers"];
  v9[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];

  v8.receiver = self;
  v8.super_class = (Class)NullCodecConfiguration;
  objc_super v5 = [(AUPasscodeCodecConfiguration *)&v8 commandLineOptions];
  float v6 = [v5 arrayByAddingObjectsFromArray:v4];

  return v6;
}

- (NullCodecConfiguration)initWithCommandLineArgs:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NullCodecConfiguration;
  objc_super v5 = [(AUPasscodeCodecConfiguration *)&v15 initWithCommandLineArgs:v4];
  float v6 = v5;
  if (v5)
  {
    [(NullCodecConfiguration *)v5 setDefaultValues];
    id v7 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v7 setNumberStyle:1];
    uint64_t v8 = [v4 count];
    if ([v4 count])
    {
      unint64_t v9 = 0;
      do
      {
        v10 = [v4 objectAtIndex:v9];
        if ([v10 isEqualToString:@"-t"]) {
          BOOL v11 = v8 == 0;
        }
        else {
          BOOL v11 = 1;
        }
        if (!v11)
        {
          v12 = [v4 objectAtIndex:++v9];
          v13 = [v7 numberFromString:v12];
          v6->_retrievalCallbackInterval = (float)(unint64_t)[v13 unsignedIntegerValue];

          --v8;
        }
        --v8;

        ++v9;
      }
      while (v9 < [v4 count]);
    }
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (float)retrievalCallbackInterval
{
  return self->_retrievalCallbackInterval;
}

- (void)setRetrievalCallbackInterval:(float)a3
{
  self->_retrievalCallbackInterval = a3;
}

@end