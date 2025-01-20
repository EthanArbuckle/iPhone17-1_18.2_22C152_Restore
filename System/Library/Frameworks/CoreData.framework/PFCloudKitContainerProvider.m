@interface PFCloudKitContainerProvider
- (id)containerWithIdentifier:(id)a3;
- (id)containerWithIdentifier:(id)a3 options:(id)a4;
@end

@implementation PFCloudKitContainerProvider

- (id)containerWithIdentifier:(id)a3
{
  Class v4 = (Class)getCloudKitCKContainerClass[0]();

  return (id)[(objc_class *)v4 containerWithIdentifier:a3];
}

- (id)containerWithIdentifier:(id)a3 options:(id)a4
{
  id result = [(PFCloudKitContainerProvider *)self containerWithIdentifier:a3];
  if (result && a4)
  {
    v6 = objc_msgSend(objc_alloc((Class)getCloudKitCKContainerClass[0]()), "initWithContainerID:options:", objc_msgSend(result, "containerID"), a4);
    return v6;
  }
  return result;
}

@end