@interface AUPasscodeCodecCommandLineOption
+ (id)optionWithSyntax:(id)a3 description:(id)a4;
- (AUPasscodeCodecCommandLineOption)initWithSyntax:(id)a3 description:(id)a4;
- (NSString)optionDescription;
- (NSString)optionSyntax;
@end

@implementation AUPasscodeCodecCommandLineOption

+ (id)optionWithSyntax:(id)a3 description:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[AUPasscodeCodecCommandLineOption alloc] initWithSyntax:v6 description:v5];

  return v7;
}

- (AUPasscodeCodecCommandLineOption)initWithSyntax:(id)a3 description:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AUPasscodeCodecCommandLineOption;
  v9 = [(AUPasscodeCodecCommandLineOption *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_optionSyntax, a3);
    objc_storeStrong((id *)&v10->_optionDescription, a4);
  }

  return v10;
}

- (NSString)optionSyntax
{
  return self->_optionSyntax;
}

- (NSString)optionDescription
{
  return self->_optionDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionDescription, 0);

  objc_storeStrong((id *)&self->_optionSyntax, 0);
}

@end