@interface IDSSenderKeyEncryptionController
- (IDSSenderKeyEncryptionController)init;
- (IDSSenderKeyEncryptionController)initWithPersistenceManager:(id)a3;
- (id)paddyDecryptData:(id)a3 keyIndex:(unsigned int)a4 keyIDByte:(id)a5 from:(id)a6 to:(id)a7;
- (id)paddyEncryptData:(id)a3 to:(id)a4 from:(id)a5;
@end

@implementation IDSSenderKeyEncryptionController

- (IDSSenderKeyEncryptionController)initWithPersistenceManager:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (objc_class *)a3;
  v7 = self;
  sub_1004DFE9C(11);
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR___IDSSenderKeyEncryptionController_persistenceManager) = v6;
  v8 = v6;

  v11.receiver = v7;
  v11.super_class = ObjectType;
  v9 = [(IDSSenderKeyEncryptionController *)&v11 init];

  return v9;
}

- (id)paddyEncryptData:(id)a3 to:(id)a4 from:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = a5;
  objc_super v11 = self;
  uint64_t v12 = sub_100725B50();
  unint64_t v14 = v13;

  id v15 = sub_10050EC34(v12, v14, v9, v10);
  sub_100442248(v12, v14);

  return v15;
}

- (id)paddyDecryptData:(id)a3 keyIndex:(unsigned int)a4 keyIDByte:(id)a5 from:(id)a6 to:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = self;
  uint64_t v17 = sub_100725B50();
  unint64_t v19 = v18;

  uint64_t v20 = sub_100725B50();
  unint64_t v22 = v21;

  id v23 = sub_10051020C(v17, v19, a4, v20, v22, v14, v15);
  sub_100442248(v20, v22);
  sub_100442248(v17, v19);

  return v23;
}

- (IDSSenderKeyEncryptionController)init
{
  result = (IDSSenderKeyEncryptionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___IDSSenderKeyEncryptionController_logger;
  uint64_t v4 = sub_100725ED0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IDSSenderKeyEncryptionController_persistenceManager);
}

@end