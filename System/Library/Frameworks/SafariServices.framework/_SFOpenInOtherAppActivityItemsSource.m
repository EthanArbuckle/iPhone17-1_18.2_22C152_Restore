@interface _SFOpenInOtherAppActivityItemsSource
- (_SFOpenInOtherAppActivityItemsSource)initWithFilePath:(id)a3;
- (id)activityViewController:(id)a3 itemsForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItems:(id)a3;
@end

@implementation _SFOpenInOtherAppActivityItemsSource

- (_SFOpenInOtherAppActivityItemsSource)initWithFilePath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFOpenInOtherAppActivityItemsSource;
  v5 = [(_SFOpenInOtherAppActivityItemsSource *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v4];
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v6;
  }
  return v5;
}

- (id)activityViewControllerPlaceholderItems:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  v5 = v4;
  if (self->_fileURL) {
    objc_msgSend(v4, "addObject:");
  }

  return v5;
}

- (id)activityViewController:(id)a3 itemsForActivityType:(id)a4
{
  id v6 = a3;
  if ([a4 isEqualToString:*MEMORY[0x1E4F435B0]])
  {
    v7 = [(_SFOpenInOtherAppActivityItemsSource *)self activityViewControllerPlaceholderItems:v6];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end