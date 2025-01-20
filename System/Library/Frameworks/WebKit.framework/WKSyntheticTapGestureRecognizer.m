@interface WKSyntheticTapGestureRecognizer
- (NSNumber)lastActiveTouchIdentifier;
- (WKTouchEventsGestureRecognizer)supportingTouchEventsGestureRecognizer;
- (id).cxx_construct;
- (void)reset;
- (void)setGestureFailedTarget:(id)a3 action:(SEL)a4;
- (void)setGestureIdentifiedTarget:(id)a3 action:(SEL)a4;
- (void)setResetTarget:(id)a3 action:(SEL)a4;
- (void)setState:(int64_t)a3;
- (void)setSupportingTouchEventsGestureRecognizer:(id)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation WKSyntheticTapGestureRecognizer

- (id).cxx_construct
{
  *((void *)self + 46) = 0;
  return self;
}

- (void)setSupportingTouchEventsGestureRecognizer:(id)a3
{
}

- (void)setResetTarget:(id)a3 action:(SEL)a4
{
  objc_storeWeak(&self->_resetTarget, a3);
  if (a4) {
    v6 = a4;
  }
  else {
    v6 = 0;
  }
  self->_resetAction = v6;
}

- (void)setGestureIdentifiedTarget:(id)a3 action:(SEL)a4
{
  objc_storeWeak(&self->_gestureIdentifiedTarget, a3);
  if (a4) {
    v6 = a4;
  }
  else {
    v6 = 0;
  }
  self->_gestureIdentifiedAction = v6;
}

- (void)setGestureFailedTarget:(id)a3 action:(SEL)a4
{
  objc_storeWeak(&self->_gestureFailedTarget, a3);
  if (a4) {
    v6 = a4;
  }
  else {
    v6 = 0;
  }
  self->_gestureFailedAction = v6;
}

- (void)setState:(int64_t)a3
{
  if (a3 == 5)
  {
    v5 = &OBJC_IVAR___WKSyntheticTapGestureRecognizer__gestureFailedTarget;
  }
  else
  {
    if (a3 != 3) {
      goto LABEL_9;
    }
    v5 = &OBJC_IVAR___WKSyntheticTapGestureRecognizer__gestureIdentifiedTarget;
  }
  id Weak = objc_loadWeak((id *)((char *)&self->super.super.super.super.isa + *v5));
  if (*(Class *)((char *)&self->super.super.super.super.isa + v5[1])) {
    uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v5[1]);
  }
  else {
    uint64_t v7 = 0;
  }
  [Weak performSelector:v7 withObject:self];
LABEL_9:
  v8.receiver = self;
  v8.super_class = (Class)WKSyntheticTapGestureRecognizer;
  [(WKSyntheticTapGestureRecognizer *)&v8 setState:a3];
}

- (void)reset
{
  v6.receiver = self;
  v6.super_class = (Class)WKSyntheticTapGestureRecognizer;
  [(WKScrollViewTrackingTapGestureRecognizer *)&v6 reset];
  id Weak = objc_loadWeak(&self->_resetTarget);
  if (self->_resetAction) {
    SEL resetAction = self->_resetAction;
  }
  else {
    SEL resetAction = 0;
  }
  [Weak performSelector:resetAction withObject:self];
  m_ptr = self->_lastActiveTouchIdentifier.m_ptr;
  self->_lastActiveTouchIdentifier.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)WKSyntheticTapGestureRecognizer;
  [(WKSyntheticTapGestureRecognizer *)&v15 touchesEnded:a3 withEvent:a4];
  if (objc_loadWeak((id *)&self->_supportingTouchEventsGestureRecognizer))
  {
    v5 = (void *)[objc_loadWeak((id *)&self->_supportingTouchEventsGestureRecognizer) activeTouchesByIdentifier];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "objectForKey:", v9), "gestureRecognizers"), "containsObject:", self))
          {
            if (v9) {
              CFRetain(v9);
            }
            m_ptr = self->_lastActiveTouchIdentifier.m_ptr;
            self->_lastActiveTouchIdentifier.m_ptr = v9;
            if (m_ptr) {
              CFRelease(m_ptr);
            }
            return;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
}

- (NSNumber)lastActiveTouchIdentifier
{
  return (NSNumber *)self->_lastActiveTouchIdentifier.m_ptr;
}

- (WKTouchEventsGestureRecognizer)supportingTouchEventsGestureRecognizer
{
  return (WKTouchEventsGestureRecognizer *)objc_loadWeak((id *)&self->_supportingTouchEventsGestureRecognizer);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_supportingTouchEventsGestureRecognizer);
  m_ptr = self->_lastActiveTouchIdentifier.m_ptr;
  self->_lastActiveTouchIdentifier.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  objc_destroyWeak(&self->_resetTarget);
  objc_destroyWeak(&self->_gestureFailedTarget);

  objc_destroyWeak(&self->_gestureIdentifiedTarget);
}

@end