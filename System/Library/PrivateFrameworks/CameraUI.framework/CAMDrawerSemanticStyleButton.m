@interface CAMDrawerSemanticStyleButton
- (BOOL)isOn;
- (BOOL)shouldShowSlashForCurrentState;
- (BOOL)shouldUseSlash;
- (CAMSemanticStyle)semanticStyle;
- (id)imageNameForCurrentState;
- (int64_t)controlType;
- (void)setOn:(BOOL)a3;
- (void)setSemanticStyle:(id)a3;
- (void)setSemanticStyle:(id)a3 animated:(BOOL)a4;
@end

@implementation CAMDrawerSemanticStyleButton

- (int64_t)controlType
{
  return 10;
}

- (id)imageNameForCurrentState
{
  return @"CAMSemanticStyleDrawerButton";
}

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    [(CAMControlDrawerButton *)self updateImage];
  }
}

- (void)setSemanticStyle:(id)a3
{
}

- (void)setSemanticStyle:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (!-[CAMSemanticStyle isEqualToSemanticStyle:](self->_semanticStyle, "isEqualToSemanticStyle:"))
  {
    objc_storeStrong((id *)&self->_semanticStyle, a3);
    [(CAMControlDrawerButton *)self updateImageAnimated:v4];
  }
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (BOOL)shouldShowSlashForCurrentState
{
  v2 = [(CAMDrawerSemanticStyleButton *)self semanticStyle];
  char v3 = [v2 isCustomizable] ^ 1;

  return v3;
}

- (BOOL)isOn
{
  return self->_on;
}

- (CAMSemanticStyle)semanticStyle
{
  return self->_semanticStyle;
}

- (void).cxx_destruct
{
}

@end