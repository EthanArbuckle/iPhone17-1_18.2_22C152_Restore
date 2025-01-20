@interface WFSelectableAlertButton
+ (id)buttonWithTitle:(id)a3 subtitle:(id)a4 selected:(BOOL)a5 stickySelection:(BOOL)a6 style:(int64_t)a7 handler:(id)a8 image:(id)a9;
+ (id)buttonWithTitle:(id)a3 subtitle:(id)a4 selected:(BOOL)a5 style:(int64_t)a6 handler:(id)a7;
- (BOOL)isSelected;
- (BOOL)stickySelection;
- (NSString)subtitle;
- (WFImage)image;
- (void)setSelected:(BOOL)a3;
@end

@implementation WFSelectableAlertButton

+ (id)buttonWithTitle:(id)a3 subtitle:(id)a4 selected:(BOOL)a5 stickySelection:(BOOL)a6 style:(int64_t)a7 handler:(id)a8 image:(id)a9
{
  id v16 = a9;
  id v17 = a4;
  uint64_t v18 = [a1 buttonWithTitle:a3 style:a7 handler:a8];
  uint64_t v19 = [v17 copy];

  v20 = *(void **)(v18 + 64);
  *(void *)(v18 + 64) = v19;

  uint64_t v21 = [v16 copy];
  v22 = *(void **)(v18 + 72);
  *(void *)(v18 + 72) = v21;

  *(unsigned char *)(v18 + 56) = a5;
  *(unsigned char *)(v18 + 57) = a6;
  return (id)v18;
}

+ (id)buttonWithTitle:(id)a3 subtitle:(id)a4 selected:(BOOL)a5 style:(int64_t)a6 handler:(id)a7
{
  return (id)[a1 buttonWithTitle:a3 subtitle:a4 selected:a5 stickySelection:0 style:a6 handler:a7 image:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
}

- (BOOL)stickySelection
{
  return self->_stickySelection;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (WFImage)image
{
  return self->_image;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    v4 = [(WFAlertButton *)self alert];
    id v9 = [v4 presenter];

    v5 = [(WFAlertButton *)self alert];
    v6 = [v5 buttons];
    uint64_t v7 = [v6 indexOfObject:self];

    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = [(WFAlertButton *)self alert];
      [v9 replaceButtonAtIndex:v7 withButton:self forAlert:v8];
    }
  }
}

@end