@interface QLDismissAction
+ (id)actionWithTitle:(id)a3 alertStyle:(int64_t)a4 shouldDismissQuickLookAutomatically:(BOOL)a5 handler:(id)a6;
+ (id)actionWithTitle:(id)a3 handler:(id)a4;
+ (id)actionWithTitle:(id)a3 image:(id)a4 alertStyle:(int64_t)a5 shouldDismissQuickLookAutomatically:(BOOL)a6 handler:(id)a7;
+ (id)actionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
+ (id)actionWithTitle:(id)a3 image:(id)a4 shouldDismissQuickLookAutomatically:(BOOL)a5 handler:(id)a6;
- (BOOL)shouldDismissQuickLookAutomatically;
- (NSString)title;
- (QLDismissAction)initWithTitle:(id)a3 image:(id)a4 shouldDismissQuickLookAutomatically:(BOOL)a5 handler:(id)a6;
- (UIImage)image;
- (id)completionHandler;
- (int64_t)alertStyle;
- (unint64_t)attributes;
- (void)setAlertStyle:(int64_t)a3;
- (void)setAttributes:(unint64_t)a3;
- (void)setShouldDismissQuickLookAutomatically:(BOOL)a3;
@end

@implementation QLDismissAction

- (QLDismissAction)initWithTitle:(id)a3 image:(id)a4 shouldDismissQuickLookAutomatically:(BOOL)a5 handler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)QLDismissAction;
  v14 = [(QLDismissAction *)&v20 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_title, a3);
    objc_storeStrong((id *)&v15->_image, a4);
    v16 = _Block_copy(v13);
    id completionHandler = v15->_completionHandler;
    v15->_id completionHandler = v16;

    v15->_shouldDismissQuickLookAutomatically = a5;
    v18 = v15;
  }

  return v15;
}

+ (id)actionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return +[QLDismissAction actionWithTitle:a3 image:a4 shouldDismissQuickLookAutomatically:1 handler:a5];
}

+ (id)actionWithTitle:(id)a3 image:(id)a4 shouldDismissQuickLookAutomatically:(BOOL)a5 handler:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = [[QLDismissAction alloc] initWithTitle:v11 image:v10 shouldDismissQuickLookAutomatically:v6 handler:v9];

  return v12;
}

+ (id)actionWithTitle:(id)a3 image:(id)a4 alertStyle:(int64_t)a5 shouldDismissQuickLookAutomatically:(BOOL)a6 handler:(id)a7
{
  BOOL v7 = a6;
  id v11 = a7;
  id v12 = a4;
  id v13 = a3;
  v14 = [[QLDismissAction alloc] initWithTitle:v13 image:v12 shouldDismissQuickLookAutomatically:v7 handler:v11];

  if (a5 == 2) {
    [(QLDismissAction *)v14 setAttributes:2];
  }

  return v14;
}

+ (id)actionWithTitle:(id)a3 handler:(id)a4
{
  return +[QLDismissAction actionWithTitle:a3 alertStyle:0 shouldDismissQuickLookAutomatically:1 handler:a4];
}

+ (id)actionWithTitle:(id)a3 alertStyle:(int64_t)a4 shouldDismissQuickLookAutomatically:(BOOL)a5 handler:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a3;
  id v11 = [[QLDismissAction alloc] initWithTitle:v10 image:0 shouldDismissQuickLookAutomatically:v6 handler:v9];

  if (a4 == 2) {
    [(QLDismissAction *)v11 setAttributes:2];
  }

  return v11;
}

- (int64_t)alertStyle
{
  return 0;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setAlertStyle:(int64_t)a3
{
  self->_alertStyle = a3;
}

- (unint64_t)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(unint64_t)a3
{
  self->_attributes = a3;
}

- (BOOL)shouldDismissQuickLookAutomatically
{
  return self->_shouldDismissQuickLookAutomatically;
}

- (void)setShouldDismissQuickLookAutomatically:(BOOL)a3
{
  self->_shouldDismissQuickLookAutomatically = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end