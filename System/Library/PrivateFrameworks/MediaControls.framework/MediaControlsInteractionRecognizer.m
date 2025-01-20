@interface MediaControlsInteractionRecognizer
- (MSVTimer)interactionTimer;
- (void)setInteractionTimer:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation MediaControlsInteractionRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(MediaControlsInteractionRecognizer *)self setState:1];
  [(MSVTimer *)self->_interactionTimer invalidate];
  objc_initWeak(&location, self);
  id v8 = objc_alloc(MEMORY[0x1E4F77A30]);
  uint64_t v9 = MEMORY[0x1E4F14428];
  id v10 = MEMORY[0x1E4F14428];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__MediaControlsInteractionRecognizer_touchesBegan_withEvent___block_invoke;
  v13[3] = &unk_1E5F0DA00;
  objc_copyWeak(&v14, &location);
  v11 = (MSVTimer *)[v8 initWithInterval:v9 queue:v13 block:1.0];
  interactionTimer = self->_interactionTimer;
  self->_interactionTimer = v11;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __61__MediaControlsInteractionRecognizer_touchesBegan_withEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setState:2];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[MediaControlsInteractionRecognizer setState:](self, "setState:", 3, a4);
  [(MSVTimer *)self->_interactionTimer invalidate];
  interactionTimer = self->_interactionTimer;
  self->_interactionTimer = 0;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[MediaControlsInteractionRecognizer setState:](self, "setState:", 4, a4);
  [(MSVTimer *)self->_interactionTimer invalidate];
  interactionTimer = self->_interactionTimer;
  self->_interactionTimer = 0;
}

- (MSVTimer)interactionTimer
{
  return self->_interactionTimer;
}

- (void)setInteractionTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end