@interface MUCompositionalStackLayoutInternal
- (MUCompositionalStackLayoutGroupInternal)group;
- (MUCompositionalStackLayoutInternal)initWithContainer:(id)a3 group:(id)a4;
- (MULayoutItem)container;
- (void)setContainer:(id)a3;
- (void)setGroup:(id)a3;
@end

@implementation MUCompositionalStackLayoutInternal

- (MUCompositionalStackLayoutInternal)initWithContainer:(id)a3 group:(id)a4
{
  void (*v7)(void *__return_ptr);
  id v8;
  MUCompositionalStackLayoutInternal *v9;
  void v11[11];

  uint64_t ObjectType = swift_getObjectType();
  v7 = *(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & *(void *)a4) + 0x58);
  swift_unknownObjectRetain();
  v8 = a4;
  v7(v11);
  v9 = (MUCompositionalStackLayoutInternal *)(*(uint64_t (**)(id, void *))(ObjectType + 104))(a3, v11);

  swift_deallocPartialClassInstance();
  return v9;
}

- (MULayoutItem)container
{
  v2 = self;
  sub_19324F3CC((uint64_t)v5);
  v3 = (void *)MEMORY[0x1996FC540](v5);
  sub_193273EE0((uint64_t)v5);

  return (MULayoutItem *)v3;
}

- (void)setContainer:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_19324F3CC((uint64_t)v6);
  swift_unknownObjectWeakAssign();
  sub_193273F08((uint64_t)v6, (uint64_t)v5);
  sub_19324F470((uint64_t)v5);
  sub_193273EE0((uint64_t)v6);
  sub_193273510();

  swift_unknownObjectRelease();
}

- (MUCompositionalStackLayoutGroupInternal)group
{
  void (*v3)(void *__return_ptr);
  MUCompositionalStackLayoutInternal *v4;
  id v5;
  void v7[11];
  uint64_t vars8;

  type metadata accessor for CompositionalStackLayout.GroupRef();
  v3 = *(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.isa) + 0x88);
  v4 = self;
  v3(v7);
  v5 = sub_19326AF64((uint64_t)v7);

  return (MUCompositionalStackLayoutGroupInternal *)v5;
}

- (void)setGroup:(id)a3
{
  void (*v5)(void *__return_ptr);
  MUCompositionalStackLayoutInternal *v6;
  id v7;
  void v8[11];
  uint64_t vars8;

  v4 = (void *)MEMORY[0x1E4FBC8C8];
  v5 = *(void (**)(void *__return_ptr))((*MEMORY[0x1E4FBC8C8] & *(void *)a3) + 0x58);
  v7 = a3;
  v6 = self;
  v5(v8);
  (*(void (**)(void *))((*v4 & (uint64_t)v6->super.super.isa) + 0x90))(v8);
}

- (void).cxx_destruct
{
}

@end