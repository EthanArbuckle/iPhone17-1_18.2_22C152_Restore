@interface AKMainEventHandler_iOS
- (AKMainEventHandler_iOS)initWithController:(id)a3;
- (AKPanGestureRecognizer)panRecognizer;
- (AKRotationGestureRecognizer)rotationRecognizer;
- (BOOL)_doubleTapRecognizerCanBeginAtPoint:(CGPoint)a3;
- (BOOL)_shouldAllowTapAtLocationInWindow:(CGPoint)a3;
- (BOOL)_tapRecognizerCanBeginAtPoint:(CGPoint)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)selectionInteractionShouldBegin:(id)a3 atPoint:(CGPoint)a4 forEvent:(id)a5 orGestureRecognizer:(id)a6;
- (UILongPressGestureRecognizer)pressRecognizer;
- (UITapGestureRecognizer)doubleTapRecognizer;
- (UITapGestureRecognizer)tapRecognizer;
- (double)lastRotationAngleInRotationGesture;
- (void)applyToAllSelectedAnnotationsRotateEvent:(id)a3 orRecognizer:(id)a4;
- (void)forwardRecognizerToMainHandleEvent:(id)a3;
- (void)setDoubleTapRecognizer:(id)a3;
- (void)setLastRotationAngleInRotationGesture:(double)a3;
- (void)setPanRecognizer:(id)a3;
- (void)setPressRecognizer:(id)a3;
- (void)setRotationRecognizer:(id)a3;
- (void)setTapRecognizer:(id)a3;
- (void)teardown;
@end

@implementation AKMainEventHandler_iOS

- (AKMainEventHandler_iOS)initWithController:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AKMainEventHandler_iOS;
  v5 = [(AKMainEventHandler *)&v17 initWithController:v4];
  if (v5)
  {
    v6 = [[AKTapGestureRecognizer alloc] initWithTarget:v5 action:sel_forwardRecognizerToMainHandleEvent_];
    tapRecognizer = v5->_tapRecognizer;
    v5->_tapRecognizer = &v6->super;

    [(UITapGestureRecognizer *)v5->_tapRecognizer setDelegate:v5];
    v8 = [[AKTapGestureRecognizer alloc] initWithTarget:v5 action:sel_forwardRecognizerToMainHandleEvent_];
    doubleTapRecognizer = v5->_doubleTapRecognizer;
    v5->_doubleTapRecognizer = &v8->super;

    [(UITapGestureRecognizer *)v5->_doubleTapRecognizer setDelegate:v5];
    [(UITapGestureRecognizer *)v5->_doubleTapRecognizer setNumberOfTapsRequired:2];
    v10 = [[AKLongPressGestureRecognizer alloc] initWithTarget:v5 action:sel_forwardRecognizerToMainHandleEvent_];
    pressRecognizer = v5->_pressRecognizer;
    v5->_pressRecognizer = &v10->super;

    [(UILongPressGestureRecognizer *)v5->_pressRecognizer setDelegate:v5];
    [(UILongPressGestureRecognizer *)v5->_pressRecognizer setMinimumPressDuration:0.2];
    v12 = [[AKPanGestureRecognizer alloc] initWithTarget:v5 action:sel_forwardRecognizerToMainHandleEvent_];
    panRecognizer = v5->_panRecognizer;
    v5->_panRecognizer = v12;

    [(AKPanGestureRecognizer *)v5->_panRecognizer setDelegate:v5];
    [(AKPanGestureRecognizer *)v5->_panRecognizer setMaximumNumberOfTouches:1];
    [(AKPanGestureRecognizer *)v5->_panRecognizer setEnabled:1];
    [(AKPanGestureRecognizer *)v5->_panRecognizer _setHysteresis:5.0];
    v14 = [[AKRotationGestureRecognizer alloc] initWithTarget:v5 action:sel_forwardRecognizerToMainHandleEvent_];
    rotationRecognizer = v5->_rotationRecognizer;
    v5->_rotationRecognizer = v14;

    [(AKRotationGestureRecognizer *)v5->_rotationRecognizer setAnnotationController:v4];
    [(AKRotationGestureRecognizer *)v5->_rotationRecognizer setDelegate:v5];
    [(UITapGestureRecognizer *)v5->_tapRecognizer requireGestureRecognizerToFail:v5->_doubleTapRecognizer];
    [(UITapGestureRecognizer *)v5->_tapRecognizer requireGestureRecognizerToFail:v5->_panRecognizer];
    [(UITapGestureRecognizer *)v5->_tapRecognizer requireGestureRecognizerToFail:v5->_rotationRecognizer];
    [(UITapGestureRecognizer *)v5->_doubleTapRecognizer requireGestureRecognizerToFail:v5->_panRecognizer];
    [(UITapGestureRecognizer *)v5->_doubleTapRecognizer requireGestureRecognizerToFail:v5->_rotationRecognizer];
    [(UILongPressGestureRecognizer *)v5->_pressRecognizer requireGestureRecognizerToFail:v5->_panRecognizer];
    [(UILongPressGestureRecognizer *)v5->_pressRecognizer requireGestureRecognizerToFail:v5->_rotationRecognizer];
    [(UITapGestureRecognizer *)v5->_doubleTapRecognizer setAllowedTouchTypes:&unk_26EA76370];
    [(UILongPressGestureRecognizer *)v5->_pressRecognizer setAllowedTouchTypes:&unk_26EA76370];
    [(AKPanGestureRecognizer *)v5->_panRecognizer setAllowedTouchTypes:&unk_26EA76388];
  }

  return v5;
}

- (void)teardown
{
  v3 = [(AKMainEventHandler_iOS *)self tapRecognizer];
  id v4 = [v3 view];
  v5 = [(AKMainEventHandler_iOS *)self tapRecognizer];
  [v4 removeGestureRecognizer:v5];

  v6 = [(AKMainEventHandler_iOS *)self tapRecognizer];
  [v6 setDelegate:0];

  [(AKMainEventHandler_iOS *)self setTapRecognizer:0];
  v7 = [(AKMainEventHandler_iOS *)self doubleTapRecognizer];
  v8 = [v7 view];
  v9 = [(AKMainEventHandler_iOS *)self doubleTapRecognizer];
  [v8 removeGestureRecognizer:v9];

  v10 = [(AKMainEventHandler_iOS *)self doubleTapRecognizer];
  [v10 setDelegate:0];

  [(AKMainEventHandler_iOS *)self setDoubleTapRecognizer:0];
  v11 = [(AKMainEventHandler_iOS *)self pressRecognizer];
  v12 = [v11 view];
  v13 = [(AKMainEventHandler_iOS *)self pressRecognizer];
  [v12 removeGestureRecognizer:v13];

  v14 = [(AKMainEventHandler_iOS *)self pressRecognizer];
  [v14 setDelegate:0];

  [(AKMainEventHandler_iOS *)self setPressRecognizer:0];
  v15 = [(AKMainEventHandler_iOS *)self rotationRecognizer];
  v16 = [v15 view];
  objc_super v17 = [(AKMainEventHandler_iOS *)self rotationRecognizer];
  [v16 removeGestureRecognizer:v17];

  v18 = [(AKMainEventHandler_iOS *)self rotationRecognizer];
  [v18 setDelegate:0];

  [(AKMainEventHandler_iOS *)self setRotationRecognizer:0];
  v19 = [(AKMainEventHandler_iOS *)self panRecognizer];
  v20 = [v19 view];
  v21 = [(AKMainEventHandler_iOS *)self panRecognizer];
  [v20 removeGestureRecognizer:v21];

  v22 = [(AKMainEventHandler_iOS *)self panRecognizer];
  [v22 setDelegate:0];

  [(AKMainEventHandler_iOS *)self setPanRecognizer:0];
  v23.receiver = self;
  v23.super_class = (Class)AKMainEventHandler_iOS;
  [(AKMainEventHandler *)&v23 teardown];
}

- (void)forwardRecognizerToMainHandleEvent:(id)a3
{
  id v10 = a3;
  id v4 = [(AKMainEventHandler_iOS *)self panRecognizer];
  if (v4 != v10)
  {
LABEL_2:

    id v5 = v10;
    goto LABEL_8;
  }
  v6 = [(AKMainEventHandler_iOS *)self panRecognizer];
  int v7 = [v6 penGestureDetected];

  id v5 = v10;
  if (v7)
  {
    uint64_t v8 = [v10 state];
    id v5 = v10;
    if (v8 == 3)
    {
      id v4 = [(AKMainEventHandler *)self controller];
      v9 = [v4 delegate];
      if (objc_opt_respondsToSelector()) {
        [v9 penStrokeCompletedForAnnotationController:v4];
      }

      goto LABEL_2;
    }
  }
LABEL_8:
  [(AKMainEventHandler *)self mainHandleEvent:0 orRecognizer:v5];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AKMainEventHandler *)self controller];
  [v7 locationInView:0];
  double v10 = v9;
  double v12 = v11;

  id v13 = [(AKMainEventHandler_iOS *)self tapRecognizer];

  if (v13 == v6)
  {
    BOOL v16 = -[AKMainEventHandler_iOS _tapRecognizerCanBeginAtPoint:](self, "_tapRecognizerCanBeginAtPoint:", v10, v12);
LABEL_8:
    BOOL v15 = v16;
    goto LABEL_9;
  }
  id v14 = [(AKMainEventHandler_iOS *)self doubleTapRecognizer];

  if (v14 == v6)
  {
    BOOL v16 = -[AKMainEventHandler_iOS _doubleTapRecognizerCanBeginAtPoint:](self, "_doubleTapRecognizerCanBeginAtPoint:", v10, v12);
    goto LABEL_8;
  }
  BOOL v15 = ([v8 annotationEditingEnabled] & 1) != 0 || objc_msgSend(v8, "formFillingEnabled");
LABEL_9:

  return v15;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(AKMainEventHandler *)self controller];
  id v6 = [v5 toolController];
  uint64_t v7 = [v6 toolMode];

  if ([v5 annotationEditingEnabled]) {
    LODWORD(v8) = 1;
  }
  else {
    LODWORD(v8) = [v5 formFillingEnabled];
  }
  id v9 = [(AKMainEventHandler_iOS *)self panRecognizer];

  if (v9 != v4)
  {
    id v10 = [(AKMainEventHandler_iOS *)self tapRecognizer];

    if (v10 == v4)
    {
      [v4 akLocationInWindow];
      BOOL v19 = -[AKMainEventHandler_iOS _tapRecognizerCanBeginAtPoint:](self, "_tapRecognizerCanBeginAtPoint:");
      goto LABEL_33;
    }
    id v11 = [(AKMainEventHandler_iOS *)self rotationRecognizer];
    if (v11 != v4)
    {

LABEL_8:
      id v12 = [(AKMainEventHandler_iOS *)self doubleTapRecognizer];
      if (v12 != v4)
      {

        goto LABEL_10;
      }
      if ([v5 annotationEditingEnabled])
      {
      }
      else
      {
        char v23 = [v5 formFillingEnabled];

        if ((v23 & 1) == 0)
        {
LABEL_10:
          id v13 = [(AKMainEventHandler_iOS *)self pressRecognizer];
          if (v13 != v4)
          {

            goto LABEL_41;
          }
          if ([v5 annotationEditingEnabled])
          {
          }
          else
          {
            char v24 = [v5 formFillingEnabled];

            if ((v24 & 1) == 0) {
              goto LABEL_41;
            }
          }
          v25 = [(AKMainEventHandler_iOS *)self panRecognizer];
          char v26 = [v25 penGestureDetected];

          if (v26)
          {
LABEL_40:
            LOBYTE(v8) = 0;
            goto LABEL_41;
          }
          v27 = [v5 toolController];
          if ([v27 toolMode] == 4)
          {
            v28 = [v5 attributeController];
            v29 = [v28 ink];
            v30 = [v29 identifier];
            char v31 = [v30 isEqual:*MEMORY[0x263F14C90]];

            if (v31) {
              goto LABEL_40;
            }
          }
          else
          {
          }
          [v4 akLocationInWindow];
          id v39 = 0;
          BOOL v33 = -[AKMainEventHandler hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:](self, "hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:", 0, 0, &v39);
          id v34 = v39;
          LOBYTE(v8) = 0;
          if (!v33)
          {
LABEL_52:

            goto LABEL_41;
          }
          v35 = [v5 textEditorController];
          v36 = [v35 annotation];

          v37 = [v5 modelController];
          v38 = [v37 allSelectedAnnotations];

          if (v34)
          {
            if ([v38 count] && (objc_msgSend(v38, "containsObject:", v34) & 1) != 0)
            {
              LOBYTE(v8) = 0;
LABEL_51:

              goto LABEL_52;
            }
            if (v36)
            {
              LODWORD(v8) = [v36 isEqual:v34] ^ 1;
              goto LABEL_51;
            }
          }
          LOBYTE(v8) = 1;
          goto LABEL_51;
        }
      }
      [v4 akLocationInWindow];
      BOOL v19 = -[AKMainEventHandler_iOS _doubleTapRecognizerCanBeginAtPoint:](self, "_doubleTapRecognizerCanBeginAtPoint:");
LABEL_33:
      LOBYTE(v8) = v19;
      goto LABEL_41;
    }
    if ([v5 annotationEditingEnabled])
    {
    }
    else
    {
      char v20 = [v5 formFillingEnabled];

      if ((v20 & 1) == 0) {
        goto LABEL_8;
      }
    }
    v21 = [v5 currentPageController];
    uint64_t v8 = [v21 pageModelController];
    v22 = [v8 selectedAnnotations];

    LOBYTE(v8) = [v22 count] != 0;
    goto LABEL_41;
  }
  [v4 locationOfFirstTouchInView:0];
  double v15 = v14;
  double v17 = v16;
  char v18 = [v5 annotationEditingEnabled];
  if (v7 == 4)
  {
    if ((v18 & 1) != 0 || [v5 formFillingEnabled])
    {
      if (!-[AKMainEventHandler hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:](self, "hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:", 1, 1, 0, v15, v17))goto LABEL_40; {
    }
      }
    else if (!v8)
    {
      goto LABEL_41;
    }
LABEL_35:
    -[AKMainEventHandler setPanGestureStartPointInWindow:](self, "setPanGestureStartPointInWindow:", v15, v17);
    LOBYTE(v8) = 1;
    goto LABEL_41;
  }
  if ((v18 & 1) == 0 && ![v5 formFillingEnabled]) {
    goto LABEL_40;
  }
  if ((unint64_t)(v7 - 1) < 2) {
    goto LABEL_35;
  }
  LOBYTE(v8) = 0;
  if (-[AKMainEventHandler hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:](self, "hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:", 1, 0, 0, v15, v17))
  {
    goto LABEL_35;
  }
LABEL_41:

  return (char)v8;
}

- (BOOL)_tapRecognizerCanBeginAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(AKMainEventHandler *)self controller];
  if (([v6 annotationEditingEnabled] & 1) != 0 || objc_msgSend(v6, "formFillingEnabled"))
  {
    char isKindOfClass = -[AKMainEventHandler_iOS _shouldAllowTapAtLocationInWindow:](self, "_shouldAllowTapAtLocationInWindow:", x, y);
  }
  else if ([v6 allEditingDisabled])
  {
    char isKindOfClass = 0;
  }
  else
  {
    id v13 = 0;
    BOOL v9 = -[AKMainEventHandler hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:](self, "hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:", 0, 0, &v13, x, y);
    id v10 = v13;
    char isKindOfClass = 0;
    if (v9)
    {
      id v11 = self;
      if (objc_opt_isKindOfClass())
      {
        char isKindOfClass = 1;
      }
      else
      {
        id v12 = self;
        char isKindOfClass = objc_opt_isKindOfClass();
      }
    }
  }
  return isKindOfClass & 1;
}

- (BOOL)_doubleTapRecognizerCanBeginAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(AKMainEventHandler *)self controller];
  if (([v6 annotationEditingEnabled] & 1) != 0 || objc_msgSend(v6, "formFillingEnabled"))
  {
    id v11 = 0;
    BOOL v7 = -[AKMainEventHandler hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:](self, "hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:", 0, 0, &v11, x, y);
    id v8 = v11;
    char v9 = 0;
    if (v7) {
      char v9 = [v6 canBeginEditingTextAnnotation:v8];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)_shouldAllowTapAtLocationInWindow:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(AKMainEventHandler *)self controller];
  BOOL v7 = [v6 currentPageController];
  id v8 = [v7 pageModelController];
  char v9 = [v8 selectedAnnotations];

  if ([v9 count])
  {
    BOOL v10 = 1;
  }
  else
  {
    uint64_t v12 = 0;
    BOOL v10 = -[AKMainEventHandler hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:](self, "hitTestAnnotationsIncludingPOI:ignoreIfDeselected:atPointInWindow:outAnnotation:", 0, 0, &v12, x, y);
  }

  return v10;
}

- (BOOL)selectionInteractionShouldBegin:(id)a3 atPoint:(CGPoint)a4 forEvent:(id)a5 orGestureRecognizer:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [v10 view];
  objc_msgSend(v12, "convertPoint:toView:", 0, x, y);
  double v14 = v13;
  double v16 = v15;

  BOOL v17 = -[AKMainEventHandler_iOS _shouldAllowTapAtLocationInWindow:](self, "_shouldAllowTapAtLocationInWindow:", v14, v16);
  objc_opt_class();
  LOBYTE(self) = objc_opt_isKindOfClass();

  if (self) {
    int v18 = [v10 hasCurrentSelection] | !v17;
  }
  else {
    LOBYTE(v18) = 1;
  }

  return v18;
}

- (void)applyToAllSelectedAnnotationsRotateEvent:(id)a3 orRecognizer:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([v5 state] == 3) {
    [(AKMainEventHandler_iOS *)self setLastRotationAngleInRotationGesture:0.0];
  }
  if ([v5 state] == 2)
  {
    id v6 = [(AKMainEventHandler *)self controller];
    BOOL v7 = [v6 currentPageController];
    id v8 = [v7 pageModelController];
    char v9 = [v8 selectedAnnotations];

    if (v9 && [v9 count])
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v23 != v13) {
              objc_enumerationMutation(v10);
            }
            double v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            if (objc_msgSend(v15, "conformsToAKRotatableAnnotationProtocol", (void)v22))
            {
              [v5 rotation];
              double v17 = 6.28318531 - v16;
              [(AKMainEventHandler_iOS *)self lastRotationAngleInRotationGesture];
              double v19 = v17 - v18;
              [v15 rotationAngle];
              [v15 setRotationAngle:v20 + v19];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v12);
      }
    }
    objc_msgSend(v5, "rotation", (void)v22);
    [(AKMainEventHandler_iOS *)self setLastRotationAngleInRotationGesture:6.28318531 - v21];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  panRecognizer = self->_panRecognizer;
  pressRecognizer = self->_pressRecognizer;
  BOOL v12 = panRecognizer == v6 && pressRecognizer == v7 || panRecognizer == v7 && pressRecognizer == v6;

  return v12;
}

- (UITapGestureRecognizer)tapRecognizer
{
  return (UITapGestureRecognizer *)objc_getProperty(self, a2, 232, 1);
}

- (void)setTapRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)doubleTapRecognizer
{
  return (UITapGestureRecognizer *)objc_getProperty(self, a2, 240, 1);
}

- (void)setDoubleTapRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)pressRecognizer
{
  return (UILongPressGestureRecognizer *)objc_getProperty(self, a2, 248, 1);
}

- (void)setPressRecognizer:(id)a3
{
}

- (AKPanGestureRecognizer)panRecognizer
{
  return (AKPanGestureRecognizer *)objc_getProperty(self, a2, 256, 1);
}

- (void)setPanRecognizer:(id)a3
{
}

- (AKRotationGestureRecognizer)rotationRecognizer
{
  return (AKRotationGestureRecognizer *)objc_getProperty(self, a2, 264, 1);
}

- (void)setRotationRecognizer:(id)a3
{
}

- (double)lastRotationAngleInRotationGesture
{
  return self->_lastRotationAngleInRotationGesture;
}

- (void)setLastRotationAngleInRotationGesture:(double)a3
{
  self->_lastRotationAngleInRotationGesture = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotationRecognizer, 0);
  objc_storeStrong((id *)&self->_panRecognizer, 0);
  objc_storeStrong((id *)&self->_pressRecognizer, 0);
  objc_storeStrong((id *)&self->_doubleTapRecognizer, 0);

  objc_storeStrong((id *)&self->_tapRecognizer, 0);
}

@end