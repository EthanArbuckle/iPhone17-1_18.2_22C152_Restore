@interface AUACustomStringProperty
- (BOOL)getPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(void *)a4 dataSize:(unsigned int *)a5 andData:(void *)a6 forClient:(int)a7;
- (_TtC9AUASDCore23AUACustomStringProperty)initWithAddress:(id)a3 propertyDataType:(unsigned int)a4 qualifierDataType:(unsigned int)a5;
@end

@implementation AUACustomStringProperty

- (BOOL)getPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(void *)a4 dataSize:(unsigned int *)a5 andData:(void *)a6 forClient:(int)a7
{
  return sub_1000A154C((char *)self, (uint64_t)a2, *(uint64_t *)&a3, (uint64_t)a4, a5, (void **)a6, *(uint64_t *)&a7, &OBJC_IVAR____TtC9AUASDCore23AUACustomStringProperty_string);
}

- (_TtC9AUASDCore23AUACustomStringProperty)initWithAddress:(id)a3 propertyDataType:(unsigned int)a4 qualifierDataType:(unsigned int)a5
{
}

- (void).cxx_destruct
{
}

@end