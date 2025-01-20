@interface GameCenterSignInActionImplementation
- (_TtC12GameCenterUI36GameCenterSignInActionImplementation)init;
- (void)signInController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5;
- (void)signInControllerDidCancel:(id)a3;
@end

@implementation GameCenterSignInActionImplementation

- (void)signInController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  v9 = self;
  id v10 = a5;
  sub_1AF4D4F18(v8, a4, a5);
}

- (void)signInControllerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4D503C(v4);
}

- (_TtC12GameCenterUI36GameCenterSignInActionImplementation)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12GameCenterUI36GameCenterSignInActionImplementation_signInViewController));

  swift_release();
}

@end