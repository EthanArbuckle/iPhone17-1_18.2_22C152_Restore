@interface _SWRemoveParticipantAlertController
+ (id)alertControllerWithParticipant:(id)a3 highlight:(id)a4 preferredStyle:(int64_t)a5;
- (SWCollaborationHighlight)highlight;
- (_SWPerson)participant;
- (id)_containedRemoteViewController;
- (id)_initWithParticipant:(id)a3 highlight:(id)a4 preferredStyle:(int64_t)a5;
- (int64_t)preferredStyle;
- (void)dismissAlert;
- (void)setHighlight:(id)a3;
- (void)setParticipant:(id)a3;
- (void)setPreferredStyle:(int64_t)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _SWRemoveParticipantAlertController

- (id)_initWithParticipant:(id)a3 highlight:(id)a4 preferredStyle:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_SWRemoveParticipantAlertController;
  v11 = [(_SWRemoveParticipantAlertController *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_participant, a3);
    objc_storeStrong((id *)&v12->_highlight, a4);
    v12->_preferredStyle = a5;
  }

  return v12;
}

+ (id)alertControllerWithParticipant:(id)a3 highlight:(id)a4 preferredStyle:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[_SWRemoveParticipantAlertController alloc] _initWithParticipant:v8 highlight:v7 preferredStyle:a5];

  [v9 setModalPresentationStyle:6];

  return v9;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)_SWRemoveParticipantAlertController;
  [(_SWRemoveParticipantAlertController *)&v5 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] clearColor];
  v4 = [(_SWRemoveParticipantAlertController *)self view];
  [v4 setBackgroundColor:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_SWRemoveParticipantAlertController;
  [(_SWRemoveParticipantAlertController *)&v8 viewWillAppear:a3];
  if (!self->_remoteAlertController)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54___SWRemoveParticipantAlertController_viewWillAppear___block_invoke;
    v5[3] = &unk_1E5665D30;
    objc_copyWeak(&v6, &location);
    id v4 = +[_SWRemoveParticipantAlertRemoteController requestViewControllerWithConnectionHandler:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (id)_containedRemoteViewController
{
  return self->_remoteAlertController;
}

- (void)dismissAlert
{
}

- (_SWPerson)participant
{
  return self->_participant;
}

- (void)setParticipant:(id)a3
{
}

- (SWCollaborationHighlight)highlight
{
  return self->_highlight;
}

- (void)setHighlight:(id)a3
{
}

- (int64_t)preferredStyle
{
  return self->_preferredStyle;
}

- (void)setPreferredStyle:(int64_t)a3
{
  self->_preferredStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_participant, 0);

  objc_storeStrong((id *)&self->_remoteAlertController, 0);
}

@end