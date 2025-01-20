@interface AXElementAction
- (AXElement)element;
- (AXElementActionDropDescriptor)dropDescriptor;
- (NSString)customActionIdentifier;
- (NSString)name;
- (id)dragActivationToken;
- (int64_t)type;
- (unint64_t)medusaGesture;
- (void)setCustomActionIdentifier:(id)a3;
- (void)setDragActivationToken:(id)a3;
- (void)setDropDescriptor:(id)a3;
- (void)setElement:(id)a3;
- (void)setMedusaGesture:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation AXElementAction

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (AXElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
}

- (NSString)customActionIdentifier
{
  return self->_customActionIdentifier;
}

- (void)setCustomActionIdentifier:(id)a3
{
}

- (id)dragActivationToken
{
  return self->_dragActivationToken;
}

- (void)setDragActivationToken:(id)a3
{
}

- (AXElementActionDropDescriptor)dropDescriptor
{
  return self->_dropDescriptor;
}

- (void)setDropDescriptor:(id)a3
{
}

- (unint64_t)medusaGesture
{
  return self->_medusaGesture;
}

- (void)setMedusaGesture:(unint64_t)a3
{
  self->_medusaGesture = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropDescriptor, 0);
  objc_storeStrong(&self->_dragActivationToken, 0);
  objc_storeStrong((id *)&self->_customActionIdentifier, 0);
  objc_storeStrong((id *)&self->_element, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end