@interface IMBalloonBrowserPlugin
- (BOOL)isBetaPlugin;
- (IMBalloonBrowserPlugin)initWithIdentifier:(id)a3 browserDisplayName:(id)a4 browserImageName:(id)a5;
- (IMBalloonBrowserPlugin)initWithIdentifier:(id)a3 browserDisplayName:(id)a4 browserImageName:(id)a5 browserClass:(Class)a6 presentationContext:(unint64_t)a7;
- (IMBalloonBrowserPlugin)initWithIdentifier:(id)a3 browserDisplayName:(id)a4 browserImagePath:(id)a5;
- (id)version;
@end

@implementation IMBalloonBrowserPlugin

- (IMBalloonBrowserPlugin)initWithIdentifier:(id)a3 browserDisplayName:(id)a4 browserImageName:(id)a5
{
  return (IMBalloonBrowserPlugin *)MEMORY[0x1F4181798](self, sel_initWithIdentifier_browserDisplayName_browserImageName_browserClass_presentationContext_, a3, a4);
}

- (IMBalloonBrowserPlugin)initWithIdentifier:(id)a3 browserDisplayName:(id)a4 browserImagePath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)IMBalloonBrowserPlugin;
  v11 = [(IMBalloonPlugin *)&v28 initWithBundle:0];
  v15 = v11;
  if (v11)
  {
    v16 = objc_msgSend_app(v11, v12, v13, v14);
    objc_msgSend_setIdentifier_(v16, v17, (uint64_t)v8, v18);

    v22 = objc_msgSend_app(v15, v19, v20, v21);
    objc_msgSend_setBrowserDisplayName_(v22, v23, (uint64_t)v9, v24);

    objc_msgSend_setBrowserImagePath_(v15, v25, (uint64_t)v10, v26);
  }

  return v15;
}

- (IMBalloonBrowserPlugin)initWithIdentifier:(id)a3 browserDisplayName:(id)a4 browserImageName:(id)a5 browserClass:(Class)a6 presentationContext:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v44.receiver = self;
  v44.super_class = (Class)IMBalloonBrowserPlugin;
  v15 = [(IMBalloonPlugin *)&v44 initWithBundle:0];
  v19 = v15;
  if (v15)
  {
    uint64_t v20 = objc_msgSend_app(v15, v16, v17, v18);
    objc_msgSend_setIdentifier_(v20, v21, (uint64_t)v12, v22);

    uint64_t v26 = objc_msgSend_app(v19, v23, v24, v25);
    objc_msgSend_setBrowserDisplayName_(v26, v27, (uint64_t)v13, v28);

    objc_msgSend_setBrowserImageName_(v19, v29, (uint64_t)v14, v30);
    v34 = objc_msgSend_app(v19, v31, v32, v33);
    objc_msgSend_setBrowserClass_(v34, v35, (uint64_t)a6, v36);

    v40 = objc_msgSend_app(v19, v37, v38, v39);
    objc_msgSend_setPresentationContexts_(v40, v41, a7, v42);
  }
  return v19;
}

- (id)version
{
  return @"IMBalloonPluginVersionUndefined";
}

- (BOOL)isBetaPlugin
{
  return 0;
}

@end