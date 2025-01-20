@interface CAMPhysicalCaptureRecognizer
- (BOOL)isSuspended;
- (CAMPhysicalCaptureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (NSArray)desiredButtons;
- (NSSet)activeButtons;
- (int64_t)_captureButtonForPressType:(int64_t)a3;
- (int64_t)lastActiveButton;
- (int64_t)pressType;
- (void)_updateApplicationButtonStatus;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)reset;
- (void)setActiveButtons:(id)a3;
- (void)setDesiredButtons:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setLastActiveButton:(int64_t)a3;
- (void)setPressType:(int64_t)a3;
- (void)setSuspended:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation CAMPhysicalCaptureRecognizer

- (CAMPhysicalCaptureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CAMPhysicalCaptureRecognizer;
  v4 = [(CAMPhysicalCaptureRecognizer *)&v10 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    v4->_suspended = 0;
    v4->_lastActiveButton = 0;
    activeButtons = v4->_activeButtons;
    v4->_activeButtons = 0;

    desiredButtons = v5->_desiredButtons;
    v5->_desiredButtons = 0;

    v5->_pressType = -1;
    [(CAMPhysicalCaptureRecognizer *)v5 _updateApplicationButtonStatus];
    v8 = v5;
  }

  return v5;
}

- (void)_updateApplicationButtonStatus
{
  int v3 = [(CAMPhysicalCaptureRecognizer *)self isEnabled];
  id v11 = [(CAMPhysicalCaptureRecognizer *)self desiredButtons];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v5 = [v11 containsObject:&unk_26BDDE9B8];
  unsigned int v6 = [v11 containsObject:&unk_26BDDE9D0];
  v7 = [MEMORY[0x263F82438] sharedApplication];
  [v7 setWantsVolumeButtonEvents:v3 & (v5 | v6)];

  if (!v5)
  {
    if (!v6) {
      goto LABEL_3;
    }
LABEL_9:
    [v4 addObject:&unk_26BDDEA00];
    if (v3) {
      goto LABEL_4;
    }
LABEL_10:
    objc_super v10 = [MEMORY[0x263F82438] sharedApplication];
    [v10 setWantsLockEvents:0];

    goto LABEL_11;
  }
  [v4 addObject:&unk_26BDDE9E8];
  if (v6) {
    goto LABEL_9;
  }
LABEL_3:
  if (!v3) {
    goto LABEL_10;
  }
LABEL_4:
  uint64_t v8 = [v11 containsObject:&unk_26BDDEA18];
  v9 = [MEMORY[0x263F82438] sharedApplication];
  [v9 setWantsLockEvents:v8];

  if (v8) {
    [v4 addObject:&unk_26BDDEA30];
  }
  if ([v11 containsObject:&unk_26BDDEA48]) {
    [v4 addObject:&unk_26BDDEA60];
  }
LABEL_11:
  [(CAMPhysicalCaptureRecognizer *)self setAllowedPressTypes:v4];
}

- (NSArray)desiredButtons
{
  return self->_desiredButtons;
}

- (void)setDesiredButtons:(id)a3
{
  if (self->_desiredButtons != a3)
  {
    id v4 = (NSArray *)[a3 copy];
    desiredButtons = self->_desiredButtons;
    self->_desiredButtons = v4;

    [(CAMPhysicalCaptureRecognizer *)self _updateApplicationButtonStatus];
  }
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CAMPhysicalCaptureRecognizer;
  [(CAMPhysicalCaptureRecognizer *)&v4 setEnabled:a3];
  [(CAMPhysicalCaptureRecognizer *)self _updateApplicationButtonStatus];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if (![(CAMPhysicalCaptureRecognizer *)self state])
  {
    [(CAMPhysicalCaptureRecognizer *)self setState:5];
  }
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)CAMPhysicalCaptureRecognizer;
  [(CAMPhysicalCaptureRecognizer *)&v3 reset];
  [(CAMPhysicalCaptureRecognizer *)self setPressType:-1];
}

- (void)setPressType:(int64_t)a3
{
  self->_pressType = a3;
}

- (int64_t)pressType
{
  return self->_pressType;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (![(CAMPhysicalCaptureRecognizer *)self isSuspended])
  {
    v23 = [(CAMPhysicalCaptureRecognizer *)self activeButtons];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v21 = v6;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (!v8) {
      goto LABEL_19;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
        uint64_t v13 = [v12 type];
        int64_t v14 = [(CAMPhysicalCaptureRecognizer *)self _captureButtonForPressType:v13];
        if (!v14) {
          goto LABEL_14;
        }
        int64_t v15 = v14;
        v16 = [NSNumber numberWithInteger:v14];
        if (([v23 containsObject:v16] & 1) == 0)
        {

LABEL_14:
          [(CAMPhysicalCaptureRecognizer *)self ignorePress:v12 forEvent:v7];
          goto LABEL_15;
        }
        uint64_t v17 = [(CAMPhysicalCaptureRecognizer *)self state];

        if (v17) {
          goto LABEL_14;
        }
        v18 = [NSNumber numberWithInteger:v15];
        if ([v23 containsObject:v18])
        {
          uint64_t v19 = [(CAMPhysicalCaptureRecognizer *)self state];

          if (!v19)
          {
            [(CAMPhysicalCaptureRecognizer *)self setLastActiveButton:v15];
            [(CAMPhysicalCaptureRecognizer *)self setState:1];
            [(CAMPhysicalCaptureRecognizer *)self setPressType:v13];
          }
        }
        else
        {
        }
LABEL_15:
        ++v11;
      }
      while (v9 != v11);
      uint64_t v20 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      uint64_t v9 = v20;
      if (!v20)
      {
LABEL_19:

        id v6 = v21;
        break;
      }
    }
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  if ([(CAMPhysicalCaptureRecognizer *)self state])
  {
    [(CAMPhysicalCaptureRecognizer *)self setState:3];
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  if ([(CAMPhysicalCaptureRecognizer *)self state])
  {
    [(CAMPhysicalCaptureRecognizer *)self setState:4];
  }
}

- (int64_t)_captureButtonForPressType:(int64_t)a3
{
  if (a3 > 103)
  {
    if (a3 != 104)
    {
      if (a3 == 601) {
        return 4;
      }
      return 0;
    }
    return 3;
  }
  else
  {
    if (a3 != 102)
    {
      if (a3 == 103) {
        return 2;
      }
      return 0;
    }
    return 1;
  }
}

- (NSSet)activeButtons
{
  return self->_activeButtons;
}

- (void)setActiveButtons:(id)a3
{
}

- (int64_t)lastActiveButton
{
  return self->_lastActiveButton;
}

- (void)setLastActiveButton:(int64_t)a3
{
  self->_lastActiveButton = a3;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredButtons, 0);
  objc_storeStrong((id *)&self->_activeButtons, 0);
}

@end