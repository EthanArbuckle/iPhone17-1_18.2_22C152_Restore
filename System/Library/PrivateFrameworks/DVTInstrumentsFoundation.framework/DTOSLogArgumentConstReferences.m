@interface DTOSLogArgumentConstReferences
@end

@implementation DTOSLogArgumentConstReferences

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->tmpArgStruct, 0);
  objc_storeStrong((id *)&self->name, 0);
  objc_storeStrong((id *)&self->prefix, 0);
  objc_storeStrong((id *)&self->stringVal, 0);
  objc_storeStrong((id *)&self->etype, 0);
}

@end