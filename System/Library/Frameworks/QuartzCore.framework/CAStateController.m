@interface CAStateController
- (CALayer)layer;
- (CAStateController)initWithLayer:(id)a3;
- (CAStateControllerDelegate)delegate;
- (id)removeAllStateChanges;
- (id)stateOfLayer:(id)a3;
- (void)_addAnimation:(id)a3 forKey:(id)a4 target:(id)a5 undo:(id)a6;
- (void)_applyTransition:(id)a3 layer:(id)a4 undo:(id)a5 speed:(float)a6;
- (void)_applyTransitionElement:(id)a3 layer:(id)a4 undo:(id)a5 speed:(float)a6;
- (void)_nextStateTimer:(id)a3;
- (void)_removeTransition:(id)a3 layer:(id)a4;
- (void)cancelTimers;
- (void)dealloc;
- (void)restoreStateChanges:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInitialStatesOfLayer:(id)a3;
- (void)setInitialStatesOfLayer:(id)a3 transitionSpeed:(float)a4;
- (void)setState:(id)a3 ofLayer:(id)a4;
- (void)setState:(id)a3 ofLayer:(id)a4 transitionSpeed:(float)a5;
@end

@implementation CAStateController

- (void)setState:(id)a3 ofLayer:(id)a4 transitionSpeed:(float)a5
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    NSLog(&cfstr_TryingToSetSta.isa);
    return;
  }
  Value = (CAStateControllerLayer *)CFDictionaryGetValue(self->_data->var1, a4);
  v10 = [(CAStateControllerLayer *)Value currentState];
  if (v10 == a3) {
    return;
  }
  v11 = v10;
  if (Value)
  {
    nextTimer = Value->_nextTimer;
    if (nextTimer)
    {
      [(NSTimer *)nextTimer invalidate];
      Value->_nextTimer = 0;

      Value->_nextState = 0;
    }
  }
  v13 = (NSArray *)[a4 states];
  v14 = (NSArray *)[a4 stateTransitions];
  if (a3)
  {
    if ([(NSArray *)v13 indexOfObjectIdenticalTo:a3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      NSLog(&cfstr_TryingToSetSta_0.isa);
      return;
    }
    if (!Value)
    {
      Value = [[CAStateControllerLayer alloc] initWithLayer:a4];
      var1 = self->_data->var1;
      CFTypeRef v16 = CFRetain(Value);
      CFDictionarySetValue(var1, a4, v16);
    }
  }
  uint64_t state = +[CATransaction disableActions];
  int v72 = state;
  if ((state & 1) == 0) {
    uint64_t state = +[CATransaction setDisableActions:1];
  }
  if (a3)
  {
    if (!v11
      || (uint64_t state = (uint64_t)find_state(v13, [(CAState *)v11 basedOn]), v18 = (CAState *)a3, (id)state != a3))
    {
      uint64_t state = (uint64_t)find_state(v13, (NSString *)[a3 basedOn]);
      v18 = (CAState *)state == v11 ? v11 : 0;
      if (v11 && (CAState *)state != v11)
      {
        v19 = v11;
        while (2)
        {
          uint64_t state = (uint64_t)a3;
          do
          {
            if (v19 == (CAState *)state)
            {
              v18 = v19;
              goto LABEL_30;
            }
            uint64_t state = (uint64_t)find_state(v13, (NSString *)[(id)state basedOn]);
          }
          while (state);
          uint64_t state = (uint64_t)find_state(v13, [(CAState *)v19 basedOn]);
          v19 = (CAState *)state;
          v18 = 0;
          if (state) {
            continue;
          }
          break;
        }
      }
    }
  }
  else
  {
    v18 = 0;
  }
LABEL_30:
  v73 = v11;
  if (Value) {
    undoStack = Value->_undoStack;
  }
  else {
    undoStack = 0;
  }
  v71 = v14;
  id v74 = a4;
  v75 = Value;
  v76 = self;
  unint64_t v77 = (unint64_t)a3;
  if (v18 == a3)
  {
    v21 = 0;
    if (!undoStack) {
      goto LABEL_48;
    }
  }
  else
  {
    do
    {
      MEMORY[0x1F4188790](state);
      v21 = &v70 - 4;
      *(&v70 - 3) = (uint64_t)a3;
      *(&v70 - 2) = 0;
      *(&v70 - 4) = v22;
      *(&v70 - 2) = (uint64_t)objc_alloc_init(CAStateControllerUndo);
      uint64_t state = (uint64_t)find_state(v13, (NSString *)[a3 basedOn]);
      a3 = (id)state;
    }
    while ((CAState *)state != v18);
    if (!undoStack) {
      goto LABEL_48;
    }
  }
  v23 = undoStack;
  do
  {
    if (v23->_state == v18) {
      break;
    }
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    transitions = v23->_transitions;
    uint64_t v25 = [(NSMutableArray *)transitions countByEnumeratingWithState:&v84 objects:v83 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v85;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v85 != v27) {
            objc_enumerationMutation(transitions);
          }
          [*(id *)(*((void *)&v84 + 1) + 8 * i) invalidate];
        }
        uint64_t v26 = [(NSMutableArray *)transitions countByEnumeratingWithState:&v84 objects:v83 count:16];
      }
      while (v26);
    }
    v23 = v23->_next;
  }
  while (v23);
LABEL_48:
  v29 = v74;
  v30 = v76;
  v31 = v71;
  if (a5 > 0.0)
  {
    transition = find_transition(v71, (__CFString *)-[CAState name](v73, "name"), (__CFString *)[(id)v77 name]);
    if (transition)
    {
      *(float *)&double v33 = a5;
      [(CAStateController *)v30 _applyTransition:transition layer:v29 undo:undoStack speed:v33];
    }
    else
    {
      if (undoStack)
      {
        v34 = undoStack;
        do
        {
          v35 = v34->_state;
          if (v35 == v18) {
            break;
          }
          v36 = find_transition(v31, (__CFString *)[(CAState *)v35 name], @"*");
          if (v36)
          {
            *(float *)&double v37 = a5;
            [(CAStateController *)v30 _applyTransition:v36 layer:v29 undo:0 speed:v37];
          }
          v34 = v34->_next;
        }
        while (v34);
      }
      if (v21)
      {
        v38 = v21;
        do
        {
          v39 = find_transition(v31, @"*", (__CFString *)[(id)v38[1] name]);
          if (v39)
          {
            *(float *)&double v40 = a5;
            [(CAStateController *)v30 _applyTransition:v39 layer:v29 undo:v38[2] speed:v40];
          }
          v38 = (uint64_t *)*v38;
        }
        while (v38);
      }
    }
  }
  if (undoStack)
  {
    do
    {
      if (undoStack->_state == v18) {
        break;
      }
      v41 = [(CAStateControllerUndo *)undoStack elements];
      uint64_t v42 = [(NSMutableArray *)v41 count];
      if (v42)
      {
        uint64_t v43 = v42 - 1;
        do
          objc_msgSend((id)-[NSMutableArray objectAtIndex:](v41, "objectAtIndex:", v43--), "apply:", 0);
        while (v43 != -1);
      }
      next = undoStack->_next;

      undoStack = next;
    }
    while (next);
  }
  for (; v21; v21 = (uint64_t *)*v21)
  {
    *(void *)(v21[2] + 8) = undoStack;
    undoStack = (CAStateControllerUndo *)v21[2];
    [(CAStateControllerUndo *)undoStack setState:v21[1]];
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    v45 = (void *)[(id)v21[1] elements];
    uint64_t v46 = [v45 countByEnumeratingWithState:&v79 objects:v78 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v80;
      do
      {
        for (uint64_t j = 0; j != v47; ++j)
        {
          if (*(void *)v80 != v48) {
            objc_enumerationMutation(v45);
          }
          [*(id *)(*((void *)&v79 + 1) + 8 * j) apply:undoStack];
        }
        uint64_t v47 = [v45 countByEnumeratingWithState:&v79 objects:v78 count:16];
      }
      while (v47);
    }
  }
  v50 = v75;
  if (v75)
  {
    [(CAStateControllerLayer *)v75 setCurrentState:v77];
    v51 = v76;
    goto LABEL_79;
  }
  v51 = v76;
  unint64_t v55 = v77;
  if (v77 | (unint64_t)undoStack)
  {
    v50 = [[CAStateControllerLayer alloc] initWithLayer:v29];
    v56 = v51->_data->var1;
    CFTypeRef v57 = CFRetain(v50);
    CFDictionarySetValue(v56, v29, v57);

    [(CAStateControllerLayer *)v50 setCurrentState:v55];
    if (!v50)
    {
      v75 = 0;
LABEL_80:
      v52 = v73;
      if (v77 && a5 > 0.0)
      {
        int v53 = [(NSArray *)v13 indexOfObjectIdenticalTo:v77];
        int v54 = v52 ? [(NSArray *)v13 indexOfObjectIdenticalTo:v52] : -1;
        if (v54 >= v53) {
          [(id)v77 previousDelay];
        }
        else {
          [(id)v77 nextDelay];
        }
        double v59 = v58;
        if ((*(void *)&v58 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
        {
          int v60 = [(NSArray *)v13 count];
          if (v54 < v53) {
            int v61 = 1;
          }
          else {
            int v61 = -1;
          }
          int v62 = v61 + v53;
          while (v62 >= -1)
          {
            int v63 = v62;
            if (v62 < v60 && v62 != -1)
            {
              int v64 = objc_msgSend(-[NSArray objectAtIndex:](v13, "objectAtIndex:", v62), "isEnabled");
              int v62 = v63 + v61;
              if (!v64) {
                continue;
              }
            }
            if (v63 < v60)
            {
              v65 = v75;
              if ((v63 & 0x80000000) == 0) {
                v65->_nextState = (CAState *)[(NSArray *)v13 objectAtIndex:v63];
              }
              double v66 = begin_time((_CAStateControllerData *)v51->_data->var3) + v59 / a5;
              uint64_t v67 = mach_absolute_time();
              v65->_nextTimer = (NSTimer *)objc_msgSend(MEMORY[0x1E4F1CB00], "timerWithTimeInterval:target:selector:userInfo:repeats:", v51, sel__nextStateTimer_, v29, 0, fmax(v66 - CATimeWithHostTime(v67), 0.0));
              v68 = (void *)[MEMORY[0x1E4F1CAC0] mainRunLoop];
              [v68 addTimer:v65->_nextTimer forMode:*MEMORY[0x1E4F1C4B0]];
              v65->_nextSpeed = a5;
            }
            goto LABEL_105;
          }
        }
      }
      goto LABEL_105;
    }
LABEL_79:
    v75 = v50;
    v50->_undoStack = undoStack;
    goto LABEL_80;
  }
  [0 setCurrentState:0];
LABEL_105:
  id WeakRetained = objc_loadWeakRetained(&v51->_data->var2);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained stateController:v51 didSetStateOfLayer:v74];
  }

  if ((v72 & 1) == 0) {
    +[CATransaction setDisableActions:0];
  }
}

- (void)_applyTransition:(id)a3 layer:(id)a4 undo:(id)a5 speed:(float)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v11 = objc_alloc_init(CAStateControllerTransition);
  v11->_controller = self;
  v11->_layer = (CALayer *)a4;
  v11->_transition = (CAStateTransition *)a3;
  [a3 duration];
  v11->_duration = v12;
  v11->_speed = a6;
  +[CATransaction commitTime];
  v11->_double beginTime = beginTime;
  if (beginTime == 0.0)
  {
    uint64_t v14 = mach_absolute_time();
    v11->_double beginTime = CATimeWithHostTime(v14);
    +[CATransaction setCommitTime:](CATransaction, "setCommitTime:");
    double beginTime = v11->_beginTime;
  }
  double v15 = v11->_duration / v11->_speed + beginTime;
  objc_msgSend(a4, "convertTime:fromLayer:", 0);
  double v17 = v16;
  [a4 convertTime:0 fromLayer:v15];
  double v19 = v18;
  v11->_masterKey = (NSString *)(id)[NSString stringWithFormat:@"\"%@\" \"%@\", objc_msgSend(a3, "fromState"), objc_msgSend(a3, "toState"")];
  v20 = +[CAAnimation animation];
  [(CAAnimation *)v20 setBeginTime:v17];
  [(CAAnimation *)v20 setDuration:v19 - v17];
  [(CAAnimation *)v20 setDelegate:v11];
  [(CAAnimation *)v20 setCAStateControllerTransition:v11];
  [a4 addAnimation:v20 forKey:v11->_masterKey];
  self->_data->var3 = v11;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v21 = (void *)[a3 elements];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v31 count:16];
  if (v22)
  {
    uint64_t v24 = v22;
    uint64_t v25 = *(void *)v33;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(v21);
        }
        *(float *)&double v23 = a6;
        [(CAStateController *)self _applyTransitionElement:*(void *)(*((void *)&v32 + 1) + 8 * v26++) layer:a4 undo:a5 speed:v23];
      }
      while (v24 != v26);
      uint64_t v24 = [v21 countByEnumeratingWithState:&v32 objects:v31 count:16];
    }
    while (v24);
  }
  if (a5) {
    [a5 addTransition:v11];
  }
  data = self->_data;
  data->var3 = 0;
  Value = (void *)CFDictionaryGetValue(data->var1, a4);
  if (Value) {
    [Value addTransition:v11];
  }
  id WeakRetained = objc_loadWeakRetained(&self->_data->var2);
  if (objc_opt_respondsToSelector())
  {
    *(float *)&double v30 = a6;
    [WeakRetained stateController:self transitionDidStart:a3 speed:v30];
  }
}

- (void)_applyTransitionElement:(id)a3 layer:(id)a4 undo:(id)a5 speed:(float)a6
{
  if ([a3 isEnabled])
  {
    uint64_t v10 = [a3 animation];
    if (v10)
    {
      v11 = (void *)v10;
      uint64_t v12 = [a3 target];
      if (v12)
      {
        v13 = (void *)v12;
        [v11 duration];
        double v15 = v14;
        double v16 = begin_time((_CAStateControllerData *)self->_data->var3);
        [v11 beginTime];
        double v18 = v17 / a6 + v16 + v15 / a6;
        objc_msgSend(v13, "convertTime:fromLayer:", 0);
        double v20 = v19;
        [v13 convertTime:0 fromLayer:v18];
        double v22 = v21;
        [v11 speed];
        if (v20 >= 0.0 && v22 > v20)
        {
          double v25 = v22 - v20;
          float v26 = v15 * v23 / (v22 - v20);
          if ((LODWORD(v26) & 0x7FFFFFFFu) <= 0x7F7FFFFF)
          {
            id v31 = (id)[v11 copy];
            [v31 setBeginTime:v20];
            if (v15 != v25)
            {
              *(float *)&double v27 = v26;
              [v31 setSpeed:v27];
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && ![v31 fromValue]
              && ![v31 toValue]
              && ![v31 byValue])
            {
              v28 = (void *)[v13 presentationLayer];
              uint64_t v29 = [v31 keyPath];
              if (!v29) {
                uint64_t v29 = [a3 key];
              }
              objc_msgSend(v31, "setFromValue:", objc_msgSend(v28, "valueForKeyPath:", v29));
            }
            uint64_t v30 = [a3 key];
            if ((objc_opt_respondsToSelector() & 1) != 0 && ![v31 keyPath]) {
              [v31 setKeyPath:v30];
            }
            [(CAStateController *)self _addAnimation:v31 forKey:v30 target:v13 undo:a5];
          }
        }
      }
    }
  }
}

- (void)_addAnimation:(id)a3 forKey:(id)a4 target:(id)a5 undo:(id)a6
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a4 = @"transition";
  }
  [a3 setRemovedOnCompletion:0];
  [a3 setCAStateControllerTransition:self->_data->var3];
  [a5 addAnimation:a3 forKey:a4];
  if (a3)
  {
    uint64_t v10 = [[CAStateControllerAnimation alloc] initWithLayer:a5 key:a4];
    [self->_data->var3 addAnimation:v10];
  }
}

- (void)_removeTransition:(id)a3 layer:(id)a4
{
  Value = (void *)CFDictionaryGetValue(self->_data->var1, a4);

  [Value removeTransition:a3];
}

- (CAStateControllerDelegate)delegate
{
  return (CAStateControllerDelegate *)objc_loadWeak(&self->_data->var2);
}

- (CALayer)layer
{
  return (CALayer *)self->_data->var0;
}

- (void)setDelegate:(id)a3
{
}

- (id)stateOfLayer:(id)a3
{
  if (a3)
  {
    Value = (void *)CFDictionaryGetValue(self->_data->var1, a3);
    return (id)[Value currentState];
  }
  else
  {
    NSLog(&cfstr_TryingToReadSt.isa, a2);
    return 0;
  }
}

- (CAStateController)initWithLayer:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CAStateController;
  v4 = [(CAStateController *)&v6 init];
  if (v4)
  {
    v4->_data = (_CAStateControllerData *)malloc_type_calloc(1uLL, 0x20uLL, 0xA0040069AE433uLL);
    v4->_data->var0 = a3;
    v4->_data->var1 = CFDictionaryCreateMutable(0, 0, 0, 0);
  }
  return v4;
}

- (void)_nextStateTimer:(id)a3
{
  Value = CFDictionaryGetValue(self->_data->var1, (const void *)[a3 userInfo]);
  if (Value)
  {
    id v6 = (id)Value[6];
    Value[5] = 0;
    Value[6] = 0;
    LODWORD(v5) = *((_DWORD *)Value + 14);
    -[CAStateController setState:ofLayer:transitionSpeed:](self, "setState:ofLayer:transitionSpeed:", v5);
  }
}

- (void)cancelTimers
{
  var1 = self->_data->var1;
  if (var1) {
    CFDictionaryApplyFunction(var1, (CFDictionaryApplierFunction)cancelTimer, 0);
  }
}

- (void)restoreStateChanges:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        -[CAStateController setState:ofLayer:transitionSpeed:](self, "setState:ofLayer:transitionSpeed:", [a3 objectForKey:*(void *)(*((void *)&v10 + 1) + 8 * v8)], *(void *)(*((void *)&v10 + 1) + 8 * v8), 0.0);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v6);
  }
}

- (id)removeAllStateChanges
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  var1 = self->_data->var1;
  uint64_t v5 = [(__CFDictionary *)var1 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(var1);
        }
        v9 = *(const void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = (const void *)objc_msgSend((id)CFDictionaryGetValue(self->_data->var1, v9), "currentState");
        if (v10)
        {
          CFDictionarySetValue(Mutable, v9, v10);
          [(CAStateController *)self setState:0 ofLayer:v9 transitionSpeed:0.0];
        }
      }
      uint64_t v6 = [(__CFDictionary *)var1 countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v6);
  }
  return Mutable;
}

- (void)setInitialStatesOfLayer:(id)a3
{
}

- (void)setInitialStatesOfLayer:(id)a3 transitionSpeed:(float)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)[a3 states];
  if (v7)
  {
    uint64_t v8 = v7;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v29 count:16];
    if (v9)
    {
      uint64_t v11 = v9;
      uint64_t v12 = *(void *)v31;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v8);
        }
        long long v14 = *(void **)(*((void *)&v30 + 1) + 8 * v13);
        if ([v14 isInitial]) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v8 countByEnumeratingWithState:&v30 objects:v29 count:16];
          if (v11) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      long long v14 = 0;
    }
    *(float *)&double v10 = a4;
    [(CAStateController *)self setState:v14 ofLayer:a3 transitionSpeed:v10];
  }
  long long v15 = (void *)[a3 sublayers];
  if (v15)
  {
    long long v16 = v15;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v24 count:16];
    if (v17)
    {
      uint64_t v19 = v17;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v16);
          }
          *(float *)&double v18 = a4;
          [(CAStateController *)self setInitialStatesOfLayer:*(void *)(*((void *)&v25 + 1) + 8 * i) transitionSpeed:v18];
        }
        uint64_t v19 = [v16 countByEnumeratingWithState:&v25 objects:v24 count:16];
      }
      while (v19);
    }
  }
  uint64_t v22 = [a3 mask];
  if (v22)
  {
    *(float *)&double v23 = a4;
    [(CAStateController *)self setInitialStatesOfLayer:v22 transitionSpeed:v23];
  }
}

- (void)setState:(id)a3 ofLayer:(id)a4
{
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  data = self->_data;
  if (data)
  {

    v4 = self->_data;
    CFDictionaryRef var1 = v4->var1;
    if (var1)
    {
      CFDictionaryApplyFunction(var1, (CFDictionaryApplierFunction)release_layer, 0);
      CFRelease(self->_data->var1);
      v4 = self->_data;
    }
    objc_storeWeak(&v4->var2, 0);
    free(self->_data);
  }
  v6.receiver = self;
  v6.super_class = (Class)CAStateController;
  [(CAStateController *)&v6 dealloc];
}

@end