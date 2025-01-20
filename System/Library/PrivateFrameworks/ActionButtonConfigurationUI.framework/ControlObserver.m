@interface ControlObserver
- (_TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver)init;
- (void)controlInstanceViewModelDidChange:(void *)a3;
- (void)dealloc;
@end

@implementation ControlObserver

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (*((unsigned char *)&self->super.isa
       + OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive) == 1)
  {
    *((unsigned char *)&self->super.isa
    + OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive) = 0;
    objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_instance), sel_unregisterObserver_, self);
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = ObjectType;
  [(ControlObserver *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_control));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_instance));
  swift_release();
}

- (void)controlInstanceViewModelDidChange:(void *)a3
{
  v4 = *(void (**)(long long *))&a1[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_updateHandler];
  id v5 = a3;
  v6 = a1;
  sub_2473D9288((uint64_t *)&v7);
  v4(&v7);
  long long v12 = v7;
  sub_2473DA190((uint64_t)&v12);
  sub_2473D31D0((uint64_t)&v8, (uint64_t)v11, (uint64_t *)&unk_26924C130);
  sub_2473DA190((uint64_t)v11);
  sub_2473D31D0((uint64_t)&v9, (uint64_t)v10, (uint64_t *)&unk_26924C130);
  sub_2473DA190((uint64_t)v10);
}

- (_TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver)init
{
  result = (_TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end