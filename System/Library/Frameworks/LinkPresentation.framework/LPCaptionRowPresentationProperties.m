@interface LPCaptionRowPresentationProperties
- (BOOL)hasAnyContent;
- (LPCaptionButtonPresentationProperties)button;
- (LPCaptionPresentationProperties)leading;
- (LPCaptionPresentationProperties)trailing;
- (LPCaptionRowPresentationProperties)init;
- (id)left;
- (id)right;
- (void)applyToAllCaptions:(id)a3;
- (void)setButton:(id)a3;
- (void)setLeading:(id)a3;
- (void)setTrailing:(id)a3;
@end

@implementation LPCaptionRowPresentationProperties

- (LPCaptionRowPresentationProperties)init
{
  v6.receiver = self;
  v6.super_class = (Class)LPCaptionRowPresentationProperties;
  v2 = [(LPCaptionRowPresentationProperties *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (LPCaptionPresentationProperties)leading
{
  leading = self->_leading;
  if (!leading)
  {
    v4 = objc_alloc_init(LPCaptionPresentationProperties);
    v5 = self->_leading;
    self->_leading = v4;

    leading = self->_leading;
  }

  return leading;
}

- (LPCaptionPresentationProperties)trailing
{
  trailing = self->_trailing;
  if (!trailing)
  {
    v4 = objc_alloc_init(LPCaptionPresentationProperties);
    v5 = self->_trailing;
    self->_trailing = v4;

    trailing = self->_trailing;
  }

  return trailing;
}

- (id)left
{
  if (appIsLTR()) {
    [(LPCaptionRowPresentationProperties *)self leading];
  }
  else {
  v3 = [(LPCaptionRowPresentationProperties *)self trailing];
  }

  return v3;
}

- (id)right
{
  if (appIsLTR()) {
    [(LPCaptionRowPresentationProperties *)self trailing];
  }
  else {
  v3 = [(LPCaptionRowPresentationProperties *)self leading];
  }

  return v3;
}

- (BOOL)hasAnyContent
{
  v3 = [(LPCaptionPresentationProperties *)self->_leading text];
  if ([v3 length])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(LPCaptionPresentationProperties *)self->_trailing text];
    BOOL v4 = [v5 length] != 0;
  }
  return v4;
}

- (void)applyToAllCaptions:(id)a3
{
  BOOL v4 = (void (**)(id, LPCaptionPresentationProperties *))a3;
  v4[2](v4, self->_leading);
  v4[2](v4, self->_trailing);
}

- (void)setLeading:(id)a3
{
}

- (void)setTrailing:(id)a3
{
}

- (LPCaptionButtonPresentationProperties)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_trailing, 0);

  objc_storeStrong((id *)&self->_leading, 0);
}

@end