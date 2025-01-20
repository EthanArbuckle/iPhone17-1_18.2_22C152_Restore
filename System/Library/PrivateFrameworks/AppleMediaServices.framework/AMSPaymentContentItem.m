@interface AMSPaymentContentItem
+ (BOOL)supportsSecureCoding;
- (AMSPaymentContentItem)initWithCoder:(id)a3;
- (CGImage)image;
- (NSAttributedString)label;
- (NSAttributedString)title;
- (NSString)accessibilityIdentifier;
- (NSString)padding;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setImage:(CGImage *)a3;
- (void)setLabel:(id)a3;
- (void)setPadding:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation AMSPaymentContentItem

- (AMSPaymentContentItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)AMSPaymentContentItem;
  v5 = [(AMSPaymentContentItem *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSAttributedString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSAttributedString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessiblityIdentifier"];
    accessibilityIdentifier = v5->_accessibilityIdentifier;
    v5->_accessibilityIdentifier = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"padding"];
    padding = v5->_padding;
    v5->_padding = (NSString *)v15;

    CFDataRef v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
    CFDataRef v18 = v17;
    if (v17 && [(__CFData *)v17 length] && (v19 = CGImageSourceCreateWithData(v18, 0)) != 0)
    {
      v20 = v19;
      if (CGImageSourceGetCount(v19)) {
        CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v20, 0, 0);
      }
      else {
        CGImageRef ImageAtIndex = 0;
      }
      CFRelease(v20);
    }
    else
    {
      CGImageRef ImageAtIndex = 0;
    }
    v5->_image = ImageAtIndex;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeObject:self->_title forKey:@"title"];
  [v8 encodeObject:self->_label forKey:@"label"];
  accessibilityIdentifier = self->_accessibilityIdentifier;
  if (accessibilityIdentifier) {
    [v8 encodeObject:accessibilityIdentifier forKey:@"accessiblityIdentifier"];
  }
  if (self->_image)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithCGImage:");
    [v8 encodeObject:v5 forKey:@"image"];
  }
  padding = self->_padding;
  v7 = v8;
  if (padding)
  {
    [v8 encodeObject:padding forKey:@"padding"];
    v7 = v8;
  }
}

- (void)dealloc
{
  CGImageRelease(self->_image);
  v3.receiver = self;
  v3.super_class = (Class)AMSPaymentContentItem;
  [(AMSPaymentContentItem *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setImage:(CGImage *)a3
{
  image = self->_image;
  if (image != a3)
  {
    CGImageRelease(image);
    self->_image = CGImageRetain(a3);
  }
}

- (CGImage)image
{
  return self->_image;
}

- (NSAttributedString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSAttributedString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setAccessibilityIdentifier:(id)a3
{
}

- (NSString)padding
{
  return self->_padding;
}

- (void)setPadding:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_padding, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end