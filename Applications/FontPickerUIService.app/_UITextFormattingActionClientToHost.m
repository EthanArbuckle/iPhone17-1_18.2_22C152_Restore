@interface _UITextFormattingActionClientToHost
+ (id)actionForChangeValue:(id)a3 textAttributesData:(id)a4;
+ (id)actionForDidFinish;
+ (id)actionForPresentColorPickerWithRect:(CGRect)a3 selectedColor:(id)a4;
+ (id)actionForPresentFontPickerWithConfiguration:(id)a3 selectedFonts:(id)a4;
+ (id)actionForPresentTypographySettingsForFont:(id)a3;
- (void)performActionForSceneController:(id)a3;
@end

@implementation _UITextFormattingActionClientToHost

+ (id)actionForChangeValue:(id)a3 textAttributesData:(id)a4
{
  id v6 = a4;
  v7 = +[NSData bs_secureDataFromObject:a3];
  id v8 = objc_alloc_init((Class)BSMutableSettings);
  [v8 setObject:&off_1000A1658 forSetting:0];
  [v8 setObject:v6 forSetting:6];

  [v8 setObject:v7 forSetting:1];
  id v9 = [objc_alloc((Class)a1) initWithInfo:v8 responder:0];

  return v9;
}

+ (id)actionForPresentColorPickerWithRect:(CGRect)a3 selectedColor:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = +[NSData bs_secureDataFromObject:a4];
  id v10 = objc_alloc_init((Class)BSMutableSettings);
  [v10 setObject:&off_1000A1670 forSetting:0];
  [v10 setObject:v9 forSetting:3];
  *(CGFloat *)v14 = x;
  *(CGFloat *)&v14[1] = y;
  *(CGFloat *)&v14[2] = width;
  *(CGFloat *)&v14[3] = height;
  v11 = +[NSValue valueWithBytes:v14 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [v10 setObject:v11 forSetting:2];

  id v12 = [objc_alloc((Class)a1) initWithInfo:v10 responder:0];

  return v12;
}

+ (id)actionForPresentFontPickerWithConfiguration:(id)a3 selectedFonts:(id)a4
{
  id v6 = a3;
  v7 = +[NSData bs_secureDataFromObject:a4];
  id v8 = objc_alloc_init((Class)BSMutableSettings);
  [v8 setObject:&off_1000A1688 forSetting:0];
  [v8 setObject:v6 forSetting:4];

  [v8 setObject:v7 forSetting:5];
  id v9 = [objc_alloc((Class)a1) initWithInfo:v8 responder:0];

  return v9;
}

+ (id)actionForPresentTypographySettingsForFont:(id)a3
{
  v4 = +[NSData bs_secureDataFromObject:a3];
  id v5 = objc_alloc_init((Class)BSMutableSettings);
  [v5 setObject:&off_1000A16A0 forSetting:0];
  [v5 setObject:v4 forSetting:5];
  id v6 = [objc_alloc((Class)a1) initWithInfo:v5 responder:0];

  return v6;
}

+ (id)actionForDidFinish
{
  id v3 = objc_alloc_init((Class)BSMutableSettings);
  [v3 setObject:&off_1000A16B8 forSetting:0];
  id v4 = [objc_alloc((Class)a1) initWithInfo:v3 responder:0];

  return v4;
}

- (void)performActionForSceneController:(id)a3
{
  id v5 = [a3 delegate];
  if (([v5 conformsToProtocol:&OBJC_PROTOCOL____UITextFormattingRemoteViewControllerHost] & 1) == 0)
  {
    v32 = +[NSAssertionHandler currentHandler];
    [v32 handleFailureInMethod:a2, self, @"_UITextFormattingActionClientToHost.m", 95, @"Scene controller's delegate (%@) does not conform to _UITextFormattingRemoteViewControllerHost", objc_opt_class() object file lineNumber description];
  }
  id v33 = v5;
  id v6 = [(_UITextFormattingActionClientToHost *)self info];
  v7 = [v6 objectForSetting:0];
  id v8 = [v7 integerValue];

  switch((unint64_t)v8)
  {
    case 0uLL:
      id v9 = [(_UITextFormattingActionClientToHost *)self info];
      id v10 = [v9 objectForSetting:1];
      v11 = +[UITextFormattingViewControllerChangeValue bs_secureDecodedFromData:v10];

      id v12 = [(_UITextFormattingActionClientToHost *)self info];
      v13 = [v12 objectForSetting:6];

      [v33 _textFormattingDidChangeValue:v11 textAttributesData:v13];
      goto LABEL_9;
    case 1uLL:
      [v33 _textFormattingDidFinish];
      break;
    case 2uLL:
      v14 = [(_UITextFormattingActionClientToHost *)self info];
      v15 = [v14 objectForSetting:3];
      v11 = +[UIColor bs_secureDecodedFromData:v15];

      v16 = [(_UITextFormattingActionClientToHost *)self info];
      v17 = [v16 objectForSetting:2];
      [v17 CGRectValue];
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;

      [v33 _presentColorPicker:v11 selectedColor:v19, v21, v23, v25];
      goto LABEL_10;
    case 3uLL:
      v26 = [(_UITextFormattingActionClientToHost *)self info];
      v11 = [v26 objectForSetting:4];

      v13 = +[NSSet setWithObject:objc_opt_class()];
      v27 = [(_UITextFormattingActionClientToHost *)self info];
      v28 = [v27 objectForSetting:5];
      v29 = +[NSArray bs_secureDecodedFromData:v28 withAdditionalClasses:v13];

      [v33 _presentFontPickerWithConfiguration:v11 selectedFonts:v29];
      goto LABEL_9;
    case 4uLL:
      v11 = +[NSSet setWithObject:objc_opt_class()];
      v30 = [(_UITextFormattingActionClientToHost *)self info];
      v31 = [v30 objectForSetting:5];
      v13 = +[UIFont bs_secureDecodedFromData:v31 withAdditionalClasses:v11];

      [v33 _presentTypographySettingsForFont:v13];
LABEL_9:

LABEL_10:
      break;
    default:
      break;
  }
}

@end