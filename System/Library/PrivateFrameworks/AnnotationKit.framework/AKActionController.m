@interface AKActionController
- (AKActionController)initWithController:(id)a3;
- (AKController)controller;
- (BOOL)_isSenderEnabled:(id)a3 segment:(int64_t)a4;
- (BOOL)isSenderEnabled:(id)a3;
- (BOOL)validateSender:(id)a3;
- (BOOL)validateSender:(id)a3 segment:(int64_t)a4;
- (void)performActionForSender:(id)a3;
- (void)performActionForSender:(id)a3 segment:(int64_t)a4;
- (void)setController:(id)a3;
@end

@implementation AKActionController

- (AKActionController)initWithController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKActionController;
  v5 = [(AKActionController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(AKActionController *)v5 setController:v4];
  }

  return v6;
}

- (void)performActionForSender:(id)a3
{
}

- (void)performActionForSender:(id)a3 segment:(int64_t)a4
{
  id v12 = a3;
  if ([(AKActionController *)self _isSenderEnabled:v12 segment:a4])
  {
    uint64_t v6 = [v12 tag];
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = [v12 tagForSegment:a4];
    }
    v7 = [(AKActionController *)self controller];
    objc_super v8 = [v7 toolController];
    v9 = [v7 attributeController];
    if ((unint64_t)(v6 - 764000) > 0x42)
    {
      if ((unint64_t)(v6 - 765000) <= 0x12C)
      {
        uint64_t v11 = [v12 tag];
        AKLog(@"performing ATTRIBUTE action for sender %@ with tag %ld ");
        objc_msgSend(v9, "performAttributeActionForSender:segment:", v12, a4, v12, v11);
      }
    }
    else
    {
      uint64_t v10 = [v12 tag];
      AKLog(@"performing TOOL action for sender %@ with tag %ld ");
      objc_msgSend(v8, "performToolActionForSender:", v12, v12, v10);
    }
  }

  MEMORY[0x270F9A758]();
}

- (BOOL)isSenderEnabled:(id)a3
{
  return [(AKActionController *)self _isSenderEnabled:a3 segment:0];
}

- (BOOL)_isSenderEnabled:(id)a3 segment:(int64_t)a4
{
  id v6 = a3;
  v7 = [(AKActionController *)self controller];
  if ([v7 currentPageIndex] == 0x7FFFFFFFFFFFFFFFLL || (objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v8 = [v6 tag];
  if (objc_opt_respondsToSelector()) {
    uint64_t v8 = [v6 tagForSegment:a4];
  }
  if ((unint64_t)(v8 - 764000) > 0x42)
  {
    if ((unint64_t)(v8 - 765000) <= 0x12C)
    {
      v9 = [v7 attributeController];
      char v10 = [v9 isAttributeSenderEnabled:v6 segment:a4];
      goto LABEL_9;
    }
LABEL_10:
    BOOL v11 = 0;
    goto LABEL_11;
  }
  v9 = [v7 toolController];
  char v10 = [v9 isToolSenderEnabled:v6];
LABEL_9:
  BOOL v11 = v10;

LABEL_11:
  return v11;
}

- (BOOL)validateSender:(id)a3
{
  return MEMORY[0x270F9A6D0](self, sel_validateSender_segment_);
}

- (BOOL)validateSender:(id)a3 segment:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(AKActionController *)self _isSenderEnabled:v6 segment:a4];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [v6 tag];
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = [v6 tagForSegment:a4];
    }
    v9 = [(AKActionController *)self controller];
    char v10 = v9;
    if ((unint64_t)(v8 - 764000) > 0x42)
    {
      if ((unint64_t)(v8 - 765000) > 0x12C)
      {
LABEL_9:

        goto LABEL_10;
      }
      BOOL v11 = [v9 attributeController];
      [v11 updateAttributeSenderState:v6 segment:a4 enabled:v7];
    }
    else
    {
      BOOL v11 = [v9 toolController];
      [v11 updateToolSenderState:v6 enabled:v7];
    }

    goto LABEL_9;
  }
LABEL_10:

  return v7;
}

- (AKController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (AKController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end