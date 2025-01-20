@interface AVTEditingPreviewModeOptions
+ (id)defaultOptions;
- (AVTEditingPreviewModeOptions)initWithFramingMode:(id)a3 bodyPosePack:(id)a4;
- (NSString)bodyPosePack;
- (NSString)framingMode;
- (id)description;
@end

@implementation AVTEditingPreviewModeOptions

+ (id)defaultOptions
{
  id v2 = objc_alloc((Class)a1);
  v3 = (void *)[v2 initWithFramingMode:*MEMORY[0x263F295E0] bodyPosePack:0];
  return v3;
}

- (AVTEditingPreviewModeOptions)initWithFramingMode:(id)a3 bodyPosePack:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTEditingPreviewModeOptions;
  v9 = [(AVTEditingPreviewModeOptions *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_framingMode, a3);
    objc_storeStrong((id *)&v10->_bodyPosePack, a4);
  }

  return v10;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)AVTEditingPreviewModeOptions;
  v3 = [(AVTEditingPreviewModeOptions *)&v10 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(AVTEditingPreviewModeOptions *)self framingMode];
  [v4 appendFormat:@" framingMode: %@\n", v5];

  v6 = [(AVTEditingPreviewModeOptions *)self bodyPosePack];

  if (v6)
  {
    id v7 = [(AVTEditingPreviewModeOptions *)self bodyPosePack];
    [v4 appendFormat:@" posePack:%@\n", v7];
  }
  id v8 = (void *)[v4 copy];

  return v8;
}

- (NSString)framingMode
{
  return self->_framingMode;
}

- (NSString)bodyPosePack
{
  return self->_bodyPosePack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyPosePack, 0);
  objc_storeStrong((id *)&self->_framingMode, 0);
}

@end