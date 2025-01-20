@interface AVTEditingPreviewMode
+ (id)defaultPreviewMode;
+ (id)stringForPreviewModeType:(unint64_t)a3;
+ (unint64_t)previewModeTypeForString:(id)a3;
- (AVTEditingPreviewMode)initWithType:(unint64_t)a3 options:(id)a4;
- (AVTEditingPreviewModeOptions)options;
- (id)description;
- (unint64_t)type;
@end

@implementation AVTEditingPreviewMode

+ (id)defaultPreviewMode
{
  v2 = [AVTEditingPreviewMode alloc];
  v3 = +[AVTEditingPreviewModeOptions defaultOptions];
  v4 = [(AVTEditingPreviewMode *)v2 initWithType:0 options:v3];

  return v4;
}

+ (unint64_t)previewModeTypeForString:(id)a3
{
  return [a3 isEqualToString:@"body"];
}

+ (id)stringForPreviewModeType:(unint64_t)a3
{
  if (a3 == 1) {
    return @"body";
  }
  else {
    return @"default";
  }
}

- (AVTEditingPreviewMode)initWithType:(unint64_t)a3 options:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AVTEditingPreviewMode;
  v8 = [(AVTEditingPreviewMode *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_options, a4);
  }

  return v9;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)AVTEditingPreviewMode;
  v3 = [(AVTEditingPreviewMode *)&v9 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = objc_msgSend((id)objc_opt_class(), "stringForPreviewModeType:", -[AVTEditingPreviewMode type](self, "type"));
  [v4 appendFormat:@" type: %@\n", v5];

  v6 = [(AVTEditingPreviewMode *)self options];
  [v4 appendFormat:@" options: %@\n", v6];

  id v7 = (void *)[v4 copy];
  return v7;
}

- (unint64_t)type
{
  return self->_type;
}

- (AVTEditingPreviewModeOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
}

@end