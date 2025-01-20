@interface _UIShareInvitationModalAddParticipantController
- (NSString)continueActionTitle;
- (_UIShareInvitationAddParticipantController)addParticipantController;
- (_UIShareInvitationModalAddParticipantController)initWithShare:(id)a3 uti:(id)a4;
- (id)completion;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setAddParticipantController:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setContinueActionTitle:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _UIShareInvitationModalAddParticipantController

- (_UIShareInvitationModalAddParticipantController)initWithShare:(id)a3 uti:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[_UIShareInvitationAddParticipantController alloc] initWithShare:v7 uti:v6];

  v12.receiver = self;
  v12.super_class = (Class)_UIShareInvitationModalAddParticipantController;
  v9 = [(_UIShareInvitationModalAddParticipantController *)&v12 initWithRootViewController:v8];
  v10 = v9;
  if (v9)
  {
    [(_UIShareInvitationModalAddParticipantController *)v9 setAddParticipantController:v8];
    [(_UIShareInvitationModalAddParticipantController *)v10 setModalPresentationStyle:2];
  }

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIShareInvitationModalAddParticipantController;
  [(_UIShareInvitationModalAddParticipantController *)&v5 viewWillAppear:a3];
  v4 = [(_UIShareInvitationModalAddParticipantController *)self presentationController];
  [v4 setDelegate:self];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  v3 = [(_UIShareInvitationModalAddParticipantController *)self completion];
  v3[2](v3, 1, &__NSArray0__struct);
}

- (void)setCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (self->_completion != v4)
  {
    id v6 = [v4 copy];
    id completion = self->_completion;
    self->_id completion = v6;

    objc_initWeak(&location, self);
    v8 = [(_UIShareInvitationModalAddParticipantController *)self addParticipantController];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100010D98;
    v9[3] = &unk_10004CD38;
    objc_copyWeak(&v10, &location);
    [v8 setCompletion:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (NSString)continueActionTitle
{
  v2 = [(_UIShareInvitationModalAddParticipantController *)self addParticipantController];
  v3 = [v2 navigationItem];
  id v4 = [v3 rightBarButtonItem];
  objc_super v5 = [v4 title];

  return (NSString *)v5;
}

- (void)setContinueActionTitle:(id)a3
{
  id v4 = a3;
  id v7 = [(_UIShareInvitationModalAddParticipantController *)self addParticipantController];
  objc_super v5 = [v7 navigationItem];
  id v6 = [v5 rightBarButtonItem];
  [v6 setTitle:v4];
}

- (_UIShareInvitationAddParticipantController)addParticipantController
{
  return self->_addParticipantController;
}

- (void)setAddParticipantController:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_addParticipantController, 0);
}

@end