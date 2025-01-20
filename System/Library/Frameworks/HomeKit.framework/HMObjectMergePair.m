@interface HMObjectMergePair
- (HMObjectMerge)oldObject;
- (HMObjectMerge)updatedObject;
- (HMObjectMergePair)initWithOldObject:(id)a3 updatedObject:(id)a4;
@end

@implementation HMObjectMergePair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedObject, 0);

  objc_storeStrong((id *)&self->_oldObject, 0);
}

- (HMObjectMerge)updatedObject
{
  return (HMObjectMerge *)objc_getProperty(self, a2, 16, 1);
}

- (HMObjectMerge)oldObject
{
  return (HMObjectMerge *)objc_getProperty(self, a2, 8, 1);
}

- (HMObjectMergePair)initWithOldObject:(id)a3 updatedObject:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v13 = (HMObjectMergeCollection *)_HMFPreconditionFailure();
    return (HMObjectMergePair *)[(HMObjectMergeCollection *)v13 initWithCurrentObjects:v15 newObjects:v16];
  }
  v17.receiver = self;
  v17.super_class = (Class)HMObjectMergePair;
  v10 = [(HMObjectMergePair *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_oldObject, a3);
    objc_storeStrong((id *)&v11->_updatedObject, a4);
  }

  return v11;
}

@end