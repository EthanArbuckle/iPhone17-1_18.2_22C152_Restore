@interface NonRetainedObjectContainer
- (NonRetainedObjectContainer)initWithObject:(id)a3;
- (id)nonRetainedObject;
- (void)setNonRetainedObject:(id)a3;
@end

@implementation NonRetainedObjectContainer

- (void).cxx_destruct
{
}

- (NonRetainedObjectContainer)initWithObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NonRetainedObjectContainer;
  v5 = [(NonRetainedObjectContainer *)&v8 init];
  v6 = v5;
  if (v5) {
    [(NonRetainedObjectContainer *)v5 setNonRetainedObject:v4];
  }

  return v6;
}

- (void)setNonRetainedObject:(id)a3
{
}

- (id)nonRetainedObject
{
  id WeakRetained = objc_loadWeakRetained(&self->_nonRetainedObject);
  return WeakRetained;
}

@end