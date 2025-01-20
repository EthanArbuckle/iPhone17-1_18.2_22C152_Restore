@interface DDParsecPreviewAction
- (BOOL)wantsSeamlessCommit;
- (DDParsecPreviewAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5;
- (id)menuActionClasses;
- (void)prepareViewControllerForActionController:(id)a3;
- (void)setPreviewMode:(BOOL)a3;
@end

@implementation DDParsecPreviewAction

- (DDParsecPreviewAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)DDParsecPreviewAction;
  v5 = [(DDAction *)&v9 initWithURL:a3 result:a4 context:a5];
  v6 = v5;
  if (v5)
  {
    [(DDParsecPreviewAction *)v5 setPreviewMode:1];
    v7 = v6;
  }

  return v6;
}

- (BOOL)wantsSeamlessCommit
{
  return 1;
}

- (void)setPreviewMode:(BOOL)a3
{
  self->super._previewMode = a3;
  -[DDParsecCollectionViewController setPreviewMode:](self->super._parsecViewController, "setPreviewMode:");
}

- (id)menuActionClasses
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
  v8[0] = v2;
  uint64_t v6 = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:1];
  v8[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];

  return v4;
}

- (void)prepareViewControllerForActionController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DDParsecPreviewAction;
  id v4 = a3;
  [(DDAction *)&v5 prepareViewControllerForActionController:v4];
  objc_msgSend(v4, "action:presentationShouldBeModal:", self, 0, v5.receiver, v5.super_class);
}

@end