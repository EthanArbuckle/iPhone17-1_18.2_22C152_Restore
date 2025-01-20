@interface MIOMutableModel
- (MIOModelDescription)modelDescription;
- (void)setModelDescription:(id)a3;
@end

@implementation MIOMutableModel

- (MIOModelDescription)modelDescription
{
  v4.receiver = self;
  v4.super_class = (Class)MIOMutableModel;
  v2 = [(MIOModel *)&v4 modelDescription];
  return (MIOModelDescription *)v2;
}

- (void)setModelDescription:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MIOMutableModel;
  [(MIOModel *)&v3 setModelDescription:a3];
}

@end