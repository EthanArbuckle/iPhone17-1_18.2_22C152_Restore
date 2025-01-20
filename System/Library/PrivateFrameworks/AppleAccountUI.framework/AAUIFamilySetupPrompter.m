@interface AAUIFamilySetupPrompter
- (AAUIFamilySetupPrompter)init;
- (AAUIFamilySetupPrompterDelegate)delegate;
- (void)familySetupPrompterDidFinish:(id)a3;
- (void)promptIfEligibleWithPresentingViewController:(id)a3 isFirstRun:(BOOL)a4;
- (void)setDelegate:(id)a3;
@end

@implementation AAUIFamilySetupPrompter

- (AAUIFamilySetupPrompter)init
{
  v10.receiver = self;
  v10.super_class = (Class)AAUIFamilySetupPrompter;
  v2 = [(AAUIFamilySetupPrompter *)&v10 init];
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
    v4 = objc_msgSend(v3, "ams_activeiTunesAccount");

    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2050000000;
    v5 = (void *)getFAFamilySetupPrompterClass_softClass;
    uint64_t v15 = getFAFamilySetupPrompterClass_softClass;
    if (!getFAFamilySetupPrompterClass_softClass)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __getFAFamilySetupPrompterClass_block_invoke;
      v11[3] = &unk_263F92608;
      v11[4] = &v12;
      __getFAFamilySetupPrompterClass_block_invoke((uint64_t)v11);
      v5 = (void *)v13[3];
    }
    v6 = v5;
    _Block_object_dispose(&v12, 8);
    uint64_t v7 = [[v6 alloc] initWithiTunesAccount:v4];
    familySetupPrompter = v2->_familySetupPrompter;
    v2->_familySetupPrompter = (FAFamilySetupPrompter *)v7;

    [(FAFamilySetupPrompter *)v2->_familySetupPrompter setDelegate:v2];
  }
  return v2;
}

- (void)promptIfEligibleWithPresentingViewController:(id)a3 isFirstRun:(BOOL)a4
{
}

- (void)familySetupPrompterDidFinish:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained familySetupPrompterDidFinish:self];
}

- (AAUIFamilySetupPrompterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUIFamilySetupPrompterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_familySetupPrompter, 0);
}

@end