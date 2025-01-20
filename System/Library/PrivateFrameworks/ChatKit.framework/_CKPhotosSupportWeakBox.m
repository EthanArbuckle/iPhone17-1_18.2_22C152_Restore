@interface _CKPhotosSupportWeakBox
- (_CKPhotosSupportWeakBox)initWithObject:(id)a3;
- (id)object;
- (void)setObject:(id)a3;
@end

@implementation _CKPhotosSupportWeakBox

- (_CKPhotosSupportWeakBox)initWithObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_CKPhotosSupportWeakBox;
  v5 = [(_CKPhotosSupportWeakBox *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak(&v5->_object, v4);
  }

  return v6;
}

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);

  return WeakRetained;
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end