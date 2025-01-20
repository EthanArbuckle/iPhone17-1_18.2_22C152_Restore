@interface CARSilentModeInCarPlayOption
+ (id)allOptions;
+ (id)optionWithFullTitle:(id)a3 footer:(id)a4 silentModeType:(unint64_t)a5;
- (CARSilentModeInCarPlayOption)initWithFullTitle:(id)a3 footer:(id)a4 silentModeType:(unint64_t)a5;
- (NSString)footer;
- (NSString)fullTitle;
- (unint64_t)silentModeType;
@end

@implementation CARSilentModeInCarPlayOption

+ (id)optionWithFullTitle:(id)a3 footer:(id)a4 silentModeType:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [[CARSilentModeInCarPlayOption alloc] initWithFullTitle:v8 footer:v7 silentModeType:a5];

  return v9;
}

- (CARSilentModeInCarPlayOption)initWithFullTitle:(id)a3 footer:(id)a4 silentModeType:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CARSilentModeInCarPlayOption;
  v11 = [(CARSilentModeInCarPlayOption *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_fullTitle, a3);
    objc_storeStrong((id *)&v12->_footer, a4);
    v12->_silentModeType = a5;
  }

  return v12;
}

+ (id)allOptions
{
  if (qword_1000B0840 != -1) {
    dispatch_once(&qword_1000B0840, &stru_1000921E0);
  }
  v2 = (void *)qword_1000B0848;

  return v2;
}

- (NSString)fullTitle
{
  return self->_fullTitle;
}

- (NSString)footer
{
  return self->_footer;
}

- (unint64_t)silentModeType
{
  return self->_silentModeType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footer, 0);

  objc_storeStrong((id *)&self->_fullTitle, 0);
}

@end