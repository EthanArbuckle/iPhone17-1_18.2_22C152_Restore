@interface ABPKTrackedObject
- (ABPKTrackedObject)initWithObjectID:(unint64_t)a3 category:(id)a4 boundingBox:(CGRect)a5 confidence:(unint64_t)a6;
- (CGRect)boundingBox;
- (NSString)category;
- (unint64_t)confidence;
- (unint64_t)objectID;
@end

@implementation ABPKTrackedObject

- (ABPKTrackedObject)initWithObjectID:(unint64_t)a3 category:(id)a4 boundingBox:(CGRect)a5 confidence:(unint64_t)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ABPKTrackedObject;
  v15 = [(ABPKTrackedObject *)&v18 init];
  v16 = v15;
  if (v15)
  {
    v15->_objectID = a3;
    objc_storeStrong((id *)&v15->_category, a4);
    v16->_boundingBox.origin.CGFloat x = x;
    v16->_boundingBox.origin.CGFloat y = y;
    v16->_boundingBox.size.CGFloat width = width;
    v16->_boundingBox.size.CGFloat height = height;
    v16->_confidence = a6;
  }

  return v16;
}

- (unint64_t)objectID
{
  return self->_objectID;
}

- (NSString)category
{
  return self->_category;
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
}

@end