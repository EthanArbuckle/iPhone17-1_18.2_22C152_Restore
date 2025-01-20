@interface CKInlineAudioReplyButtonController
- (BOOL)isStarted;
- (CKInlineAudioReplyButtonController)initWithStartButton:(id)a3 stopButton:(id)a4;
- (CKInlineAudioReplyButtonDelegate)delegate;
- (UIButton)startButton;
- (UIButton)stopButton;
- (double)holdThreshold;
- (double)touchDownTime;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setHoldThreshold:(double)a3;
- (void)setStartButton:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setStopButton:(id)a3;
- (void)setTouchDownTime:(double)a3;
- (void)touchDownInStartButton:(id)a3 event:(id)a4;
- (void)touchDragEnter:(id)a3;
- (void)touchDragExit:(id)a3;
- (void)touchUpInStartButton:(id)a3 event:(id)a4;
- (void)touchUpInStopButton:(id)a3;
- (void)touchUpOutsideStartButton:(id)a3 event:(id)a4;
@end

@implementation CKInlineAudioReplyButtonController

- (CKInlineAudioReplyButtonController)initWithStartButton:(id)a3 stopButton:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CKInlineAudioReplyButtonController;
  v8 = [(CKInlineAudioReplyButtonController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(CKInlineAudioReplyButtonController *)v8 setHoldThreshold:0.255];
    [v6 addTarget:v9 action:sel_touchDownInStartButton_event_ forControlEvents:1];
    [v6 addTarget:v9 action:sel_touchUpInStartButton_event_ forControlEvents:64];
    [v6 addTarget:v9 action:sel_touchUpOutsideStartButton_event_ forControlEvents:128];
    [v7 addTarget:v9 action:sel_touchUpInStopButton_ forControlEvents:64];
    [v6 addTarget:v9 action:sel_touchDragEnter_ forControlEvents:16];
    [v7 addTarget:v9 action:sel_touchDragEnter_ forControlEvents:16];
    [v6 addTarget:v9 action:sel_touchDragExit_ forControlEvents:32];
    [v7 addTarget:v9 action:sel_touchDragExit_ forControlEvents:32];
    [(CKInlineAudioReplyButtonController *)v9 setStartButton:v6];
    [(CKInlineAudioReplyButtonController *)v9 setStopButton:v7];
    [(CKInlineAudioReplyButtonController *)v9 setStarted:0];
  }

  return v9;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F42B08] activeKeyboard];
  [v3 setDisableInteraction:0];

  [(UIButton *)self->_startButton removeTarget:self action:0 forControlEvents:0];
  [(UIButton *)self->_stopButton removeTarget:self action:0 forControlEvents:0];
  v4.receiver = self;
  v4.super_class = (Class)CKInlineAudioReplyButtonController;
  [(CKInlineAudioReplyButtonController *)&v4 dealloc];
}

- (void)setStarted:(BOOL)a3
{
  BOOL v3 = a3;
  self->_started = a3;
  v5 = [(CKInlineAudioReplyButtonController *)self startButton];
  id v6 = v5;
  if (v3)
  {
    [v5 setAlpha:0.0];

    id v7 = [(CKInlineAudioReplyButtonController *)self stopButton];
    [v7 setAlpha:1.0];

    v8 = [MEMORY[0x1E4F42B08] activeKeyboard];
    id v11 = v8;
    uint64_t v9 = 1;
  }
  else
  {
    [v5 setAlpha:1.0];

    v10 = [(CKInlineAudioReplyButtonController *)self stopButton];
    [v10 setAlpha:0.0];

    v8 = [MEMORY[0x1E4F42B08] activeKeyboard];
    id v11 = v8;
    uint64_t v9 = 0;
  }
  [v8 setDisableInteraction:v9];
}

- (void)touchDownInStartButton:(id)a3 event:(id)a4
{
  objc_msgSend(a4, "timestamp", a3);
  -[CKInlineAudioReplyButtonController setTouchDownTime:](self, "setTouchDownTime:");
  if ([(CKInlineAudioReplyButtonController *)self isStarted])
  {
    [(CKInlineAudioReplyButtonController *)self setStarted:0];
    id v6 = [(CKInlineAudioReplyButtonController *)self delegate];
    [v6 audioReplyButtonStop:self];
  }
  else
  {
    [(CKInlineAudioReplyButtonController *)self setStarted:1];
    v5 = [(CKInlineAudioReplyButtonController *)self stopButton];
    [v5 setHighlighted:1];

    id v6 = [(CKInlineAudioReplyButtonController *)self delegate];
    [v6 audioReplyButtonStart:self];
  }
}

- (void)touchUpInStartButton:(id)a3 event:(id)a4
{
  objc_msgSend(a4, "timestamp", a3);
  double v6 = v5;
  [(CKInlineAudioReplyButtonController *)self touchDownTime];
  double v8 = v6 - v7;
  [(CKInlineAudioReplyButtonController *)self holdThreshold];
  if (v8 > v9 && [(CKInlineAudioReplyButtonController *)self isStarted])
  {
    [(CKInlineAudioReplyButtonController *)self setStarted:0];
    id v10 = [(CKInlineAudioReplyButtonController *)self delegate];
    [v10 audioReplyButtonStop:self];
  }
  else
  {
    id v10 = [(CKInlineAudioReplyButtonController *)self stopButton];
    [v10 setHighlighted:0];
  }
}

- (void)touchUpOutsideStartButton:(id)a3 event:(id)a4
{
  -[CKInlineAudioReplyButtonController setStarted:](self, "setStarted:", 0, a4);
  id v5 = [(CKInlineAudioReplyButtonController *)self delegate];
  [v5 audioReplyButtonCancel:self];
}

- (void)touchUpInStopButton:(id)a3
{
  if ([(CKInlineAudioReplyButtonController *)self isStarted])
  {
    [(CKInlineAudioReplyButtonController *)self setStarted:0];
    id v4 = [(CKInlineAudioReplyButtonController *)self delegate];
    [v4 audioReplyButtonStop:self];
  }
}

- (void)touchDragEnter:(id)a3
{
  id v3 = [(CKInlineAudioReplyButtonController *)self stopButton];
  [v3 setHighlighted:1];
}

- (void)touchDragExit:(id)a3
{
  id v3 = [(CKInlineAudioReplyButtonController *)self stopButton];
  [v3 setHighlighted:0];
}

- (BOOL)isStarted
{
  return self->_started;
}

- (CKInlineAudioReplyButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKInlineAudioReplyButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIButton)startButton
{
  return self->_startButton;
}

- (void)setStartButton:(id)a3
{
}

- (UIButton)stopButton
{
  return self->_stopButton;
}

- (void)setStopButton:(id)a3
{
}

- (double)holdThreshold
{
  return self->_holdThreshold;
}

- (void)setHoldThreshold:(double)a3
{
  self->_holdThreshold = a3;
}

- (double)touchDownTime
{
  return self->_touchDownTime;
}

- (void)setTouchDownTime:(double)a3
{
  self->_touchDownTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopButton, 0);
  objc_storeStrong((id *)&self->_startButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end