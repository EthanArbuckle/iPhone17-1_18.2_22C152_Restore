@interface HRSpeedBumpItem
- (HRSpeedBumpItem)initWithTitle:(id)a3 body:(id)a4 bubbles:(id)a5 category:(int64_t)a6;
- (NSArray)bubbles;
- (NSString)body;
- (NSString)title;
- (id)delegate;
- (int64_t)category;
- (void)setDelegate:(id)a3;
@end

@implementation HRSpeedBumpItem

- (HRSpeedBumpItem)initWithTitle:(id)a3 body:(id)a4 bubbles:(id)a5 category:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HRSpeedBumpItem;
  v14 = [(HRSpeedBumpItem *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_title, a3);
    objc_storeStrong((id *)&v15->_body, a4);
    objc_storeStrong((id *)&v15->_bubbles, a5);
    v15->_category = a6;
  }

  return v15;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)body
{
  return self->_body;
}

- (NSArray)bubbles
{
  return self->_bubbles;
}

- (int64_t)category
{
  return self->_category;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_bubbles, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end