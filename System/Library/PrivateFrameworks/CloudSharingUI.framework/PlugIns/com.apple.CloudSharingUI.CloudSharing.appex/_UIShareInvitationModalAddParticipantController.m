@interface _UIShareInvitationModalAddParticipantController
- (NSString)continueActionTitle;
- (_UIShareInvitationAddParticipantController)addParticipantController;
- (_UIShareInvitationModalAddParticipantController)initWithCoder:(id)a3;
- (_UIShareInvitationModalAddParticipantController)initWithCurrentAddresses:(id)a3;
- (_UIShareInvitationModalAddParticipantController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_UIShareInvitationModalAddParticipantController)initWithNibName:(id)a3 bundle:(id)a4;
- (_UIShareInvitationModalAddParticipantController)initWithRootViewController:(id)a3;
- (id)completion;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setAddParticipantController:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setContinueActionTitle:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _UIShareInvitationModalAddParticipantController

- (_UIShareInvitationModalAddParticipantController)initWithRootViewController:(id)a3
{
  return [(_UIShareInvitationModalAddParticipantController *)self initWithCurrentAddresses:&__NSArray0__struct];
}

- (_UIShareInvitationModalAddParticipantController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  return -[_UIShareInvitationModalAddParticipantController initWithCurrentAddresses:](self, "initWithCurrentAddresses:", &__NSArray0__struct, a4);
}

- (_UIShareInvitationModalAddParticipantController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[_UIShareInvitationModalAddParticipantController initWithCurrentAddresses:](self, "initWithCurrentAddresses:", &__NSArray0__struct, a4);
}

- (_UIShareInvitationModalAddParticipantController)initWithCoder:(id)a3
{
  return [(_UIShareInvitationModalAddParticipantController *)self initWithCurrentAddresses:&__NSArray0__struct];
}

- (_UIShareInvitationModalAddParticipantController)initWithCurrentAddresses:(id)a3
{
  id v4 = a3;
  v5 = [[_UIShareInvitationAddParticipantController alloc] initWithCurrentAddresses:v4];

  v9.receiver = self;
  v9.super_class = (Class)_UIShareInvitationModalAddParticipantController;
  v6 = [(_UIShareInvitationModalAddParticipantController *)&v9 initWithRootViewController:v5];
  v7 = v6;
  if (v6)
  {
    [(_UIShareInvitationModalAddParticipantController *)v6 setAddParticipantController:v5];
    [(_UIShareInvitationModalAddParticipantController *)v7 setModalPresentationStyle:2];
  }

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIShareInvitationModalAddParticipantController;
  [(_UIShareInvitationModalAddParticipantController *)&v5 viewWillAppear:a3];
  id v4 = [(_UIShareInvitationModalAddParticipantController *)self presentationController];
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
    v9[2] = sub_100008404;
    v9[3] = &unk_1000FF020;
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