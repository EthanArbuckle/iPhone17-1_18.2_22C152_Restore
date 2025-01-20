@interface SKANFetchPostbackRejectedParams
- (InstallAttributionParams)params;
- (NSError)error;
- (_TtC9appstored31SKANFetchPostbackRejectedParams)init;
- (_TtC9appstored31SKANFetchPostbackRejectedParams)initWithError:(id)a3 params:(id)a4;
@end

@implementation SKANFetchPostbackRejectedParams

- (NSError)error
{
  return (NSError *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC9appstored31SKANFetchPostbackRejectedParams_error));
}

- (InstallAttributionParams)params
{
  return (InstallAttributionParams *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                             + OBJC_IVAR____TtC9appstored31SKANFetchPostbackRejectedParams_params));
}

- (_TtC9appstored31SKANFetchPostbackRejectedParams)initWithError:(id)a3 params:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored31SKANFetchPostbackRejectedParams_error) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored31SKANFetchPostbackRejectedParams_params) = (Class)a4;
  v11.receiver = self;
  v11.super_class = ObjectType;
  id v8 = a3;
  id v9 = a4;
  return [(SKANFetchPostbackRejectedParams *)&v11 init];
}

- (_TtC9appstored31SKANFetchPostbackRejectedParams)init
{
  result = (_TtC9appstored31SKANFetchPostbackRejectedParams *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored31SKANFetchPostbackRejectedParams_params);
}

@end