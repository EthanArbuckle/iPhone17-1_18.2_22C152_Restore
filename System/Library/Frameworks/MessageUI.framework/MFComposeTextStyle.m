@interface MFComposeTextStyle
+ (BOOL)isTextListStyleOrdered:(id)a3;
+ (SEL)editSelectorForTextStyleType:(int64_t)a3;
+ (id)accessibilityIdenitifierForTextStyleType:(int64_t)a3;
+ (id)composeTextStyleForTextStyleType:(int64_t)a3;
+ (id)imageNameForTextStyleType:(int64_t)a3;
- (MFComposeTextStyle)initWithTextStyleType:(int64_t)a3;
- (NSString)accessibilityIdenitifier;
- (NSString)imageName;
- (SEL)editSelector;
- (int64_t)styleType;
@end

@implementation MFComposeTextStyle

- (MFComposeTextStyle)initWithTextStyleType:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MFComposeTextStyle;
  v4 = [(MFComposeTextStyle *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_styleType = a3;
    uint64_t v6 = [(id)objc_opt_class() imageNameForTextStyleType:a3];
    imageName = v5->_imageName;
    v5->_imageName = (NSString *)v6;

    uint64_t v8 = [(id)objc_opt_class() accessibilityIdenitifierForTextStyleType:a3];
    accessibilityIdenitifier = v5->_accessibilityIdenitifier;
    v5->_accessibilityIdenitifier = (NSString *)v8;

    v5->_editSelector = (SEL)[(id)objc_opt_class() editSelectorForTextStyleType:a3];
  }
  return v5;
}

+ (id)composeTextStyleForTextStyleType:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTextStyleType:a3];

  return v3;
}

+ (id)imageNameForTextStyleType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xE)
  {
    v4 = 0;
  }
  else
  {
    v4 = *off_1E5F79F98[a3 - 1];
  }
  return v4;
}

+ (id)accessibilityIdenitifierForTextStyleType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xE)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = **((id **)&unk_1E5F7A010 + a3 - 1);
  }
  return v4;
}

+ (SEL)editSelectorForTextStyleType:(int64_t)a3
{
  SEL result = 0;
  switch(a3)
  {
    case 1:
      SEL result = sel_toggleBoldface_;
      break;
    case 2:
      SEL result = sel_toggleItalics_;
      break;
    case 3:
      SEL result = sel_toggleUnderline_;
      break;
    case 4:
      SEL result = sel__toggleStrikeThrough_;
      break;
    case 7:
      SEL result = sel__insertOrderedList_;
      break;
    case 8:
      SEL result = sel__insertUnorderedList_;
      break;
    case 9:
      SEL result = sel__outdent_;
      break;
    case 10:
      SEL result = sel__indent_;
      break;
    case 13:
      SEL result = sel__alignLeft_;
      break;
    case 14:
      SEL result = sel__alignCenter_;
      break;
    case 15:
      SEL result = sel__alignRight_;
      break;
    default:
      return result;
  }
  return result;
}

+ (BOOL)isTextListStyleOrdered:(id)a3
{
  v7[7] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v7[0] = @"{box}";
  v7[1] = @"{check}";
  v7[2] = @"{circle}";
  v7[3] = @"{diamond}";
  v7[4] = @"{disc}";
  v7[5] = @"{hyphen}";
  v7[6] = @"{square}";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:7];
  char v5 = [v4 containsObject:v3];

  return v5 ^ 1;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (NSString)accessibilityIdenitifier
{
  return self->_accessibilityIdenitifier;
}

- (SEL)editSelector
{
  return self->_editSelector;
}

- (int64_t)styleType
{
  return self->_styleType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityIdenitifier, 0);

  objc_storeStrong((id *)&self->_imageName, 0);
}

@end