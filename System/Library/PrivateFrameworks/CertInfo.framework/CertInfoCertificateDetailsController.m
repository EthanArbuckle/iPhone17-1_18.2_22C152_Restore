@interface CertInfoCertificateDetailsController
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)showsDoneButton;
- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4;
- (CertInfoCertificateDetailsController)initWithCertificateProperties:(id)a3;
- (CertInfoCertificateDetailsController)initWithTrust:(__SecTrust *)a3;
- (CertInfoCertificateDetailsController)initWithTrust:(__SecTrust *)a3 certificateIndex:(int64_t)a4;
- (CertInfoCertificateDetailsControllerDelegate)delegate;
- (id)_propertiesForIndexPath:(id)a3;
- (id)_sectionsForProperties:(id)a3;
- (id)_sectionsForProperties:(id)a3 currentSectionDictionary:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_doneButtonPressed:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setShowsDoneButton:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
@end

@implementation CertInfoCertificateDetailsController

- (CertInfoCertificateDetailsController)initWithTrust:(__SecTrust *)a3
{
  return [(CertInfoCertificateDetailsController *)self initWithTrust:a3 certificateIndex:0];
}

- (CertInfoCertificateDetailsController)initWithTrust:(__SecTrust *)a3 certificateIndex:(int64_t)a4
{
  if (a3)
  {
    if ((a4 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
  }
  else
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"CertInfoCertificateDetailsController.m" lineNumber:94 description:@"trust must be non-NULL"];

    if ((a4 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
  }
  v12 = [MEMORY[0x263F08690] currentHandler];
  [v12 handleFailureInMethod:a2 object:self file:@"CertInfoCertificateDetailsController.m" lineNumber:95 description:@"certificateIndex must be greater than or equal to zero"];

LABEL_3:
  if (SecTrustGetCertificateCount(a3) <= a4)
  {
    v9 = 0;
  }
  else
  {
    v8 = (CertInfoCertificateDetailsController *)SecTrustCopyDetailedPropertiesAtIndex();
    v9 = [(CertInfoCertificateDetailsController *)self initWithCertificateProperties:v8];
    self = v8;
  }

  return v9;
}

- (CertInfoCertificateDetailsController)initWithCertificateProperties:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CertInfoCertificateDetailsController;
  v5 = [(CertInfoCertificateDetailsController *)&v14 initWithStyle:1];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(CertInfoCertificateDetailsController *)v5 _sectionsForProperties:v4];
    sectionDictionaries = v6->_sectionDictionaries;
    v6->_sectionDictionaries = (NSArray *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:v6 action:sel__doneButtonPressed_];
    doneButton = v6->_doneButton;
    v6->_doneButton = (UIBarButtonItem *)v9;

    v11 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CertInfo"];
    v12 = [v11 localizedStringForKey:@"CERTIFICATE" value:&stru_26C9B5AF8 table:@"CertInfo"];
    [(CertInfoCertificateDetailsController *)v6 setTitle:v12];
  }
  return v6;
}

- (id)_sectionsForProperties:(id)a3
{
  return [(CertInfoCertificateDetailsController *)self _sectionsForProperties:a3 currentSectionDictionary:0];
}

- (id)_sectionsForProperties:(id)a3 currentSectionDictionary:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v30 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = [v6 objectForKey:@"CertInfoCertificateDetailsSectionPropertiesKey"];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    uint64_t v11 = *MEMORY[0x263F174D0];
    uint64_t v32 = *MEMORY[0x263F174D8];
    uint64_t v31 = *MEMORY[0x263F174F8];
    uint64_t v28 = *MEMORY[0x263F174E0];
    do
    {
      uint64_t v12 = 0;
      uint64_t v27 = v9;
      do
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v33 + 1) + 8 * v12);
        objc_super v14 = [v13 objectForKey:v11];
        v15 = [v13 objectForKey:v32];
        int v16 = [v15 isEqualToString:v31];

        if (v16)
        {
          v17 = [v13 objectForKey:v28];
          if ([v17 count])
          {
            uint64_t v18 = v11;
            uint64_t v19 = v10;
            v20 = v7;
            v21 = [MEMORY[0x263EFF980] array];
            v22 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithObjectsAndKeys:", v14, @"CertInfoCertificateDetailsSectionLabelKey", v21, @"CertInfoCertificateDetailsSectionPropertiesKey", 0);
            v23 = [(CertInfoCertificateDetailsController *)self _sectionsForProperties:v17 currentSectionDictionary:v22];
            if ([v21 count]) {
              [v30 addObject:v22];
            }
            if ([v23 count]) {
              [v30 addObjectsFromArray:v23];
            }
            if ([v21 count] || objc_msgSend(v23, "count"))
            {

              id v6 = 0;
            }

            uint64_t v7 = v20;
            uint64_t v10 = v19;
            uint64_t v11 = v18;
            uint64_t v9 = v27;
          }
        }
        else
        {
          if (!v6)
          {
            uint64_t v24 = [MEMORY[0x263EFF980] array];

            id v6 = [MEMORY[0x263EFF9A0] dictionaryWithObject:v24 forKey:@"CertInfoCertificateDetailsSectionPropertiesKey"];
            [v30 addObject:v6];
            uint64_t v7 = (void *)v24;
          }
          [v7 addObject:v13];
        }

        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v9);
  }

  return v30;
}

- (void)setShowsDoneButton:(BOOL)a3
{
  *((unsigned char *)self + 1048) = *((unsigned char *)self + 1048) & 0xFE | a3;
  id v4 = [(CertInfoCertificateDetailsController *)self navigationItem];
  id v5 = [v4 rightBarButtonItem];
  doneButton = self->_doneButton;

  if ((*((unsigned char *)self + 1048) & 1) == 0 || v5 == doneButton)
  {
    if ((*((unsigned char *)self + 1048) & 1) != 0 || v5 != doneButton) {
      return;
    }
    uint64_t v8 = [(CertInfoCertificateDetailsController *)self navigationItem];
    id v10 = v8;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v7 = self->_doneButton;
    uint64_t v8 = [(CertInfoCertificateDetailsController *)self navigationItem];
    id v10 = v8;
    uint64_t v9 = v7;
  }
  [v8 setRightBarButtonItem:v9];
}

- (BOOL)showsDoneButton
{
  return *((unsigned char *)self + 1048) & 1;
}

- (void)_doneButtonPressed:(id)a3
{
  id v4 = [(CertInfoCertificateDetailsController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CertInfoCertificateDetailsController *)self delegate];
    [v6 certificateDetailsControllerDidFinish:self];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_sectionDictionaries count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(NSArray *)self->_sectionDictionaries objectAtIndex:a4];
  char v5 = [v4 objectForKey:@"CertInfoCertificateDetailsSectionPropertiesKey"];
  int64_t v6 = [v5 count];

  return v6;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = [(NSArray *)self->_sectionDictionaries objectAtIndex:a4];
  char v5 = [v4 objectForKey:@"CertInfoCertificateDetailsSectionLabelKey"];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"CertInfoCertificateDetailsControllerTableCell"];
  if (!v7) {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:1 reuseIdentifier:@"CertInfoCertificateDetailsControllerTableCell"];
  }
  uint64_t v8 = [(CertInfoCertificateDetailsController *)self _propertiesForIndexPath:v6];
  uint64_t v9 = [v8 objectForKey:*MEMORY[0x263F174D0]];
  id v10 = [v7 textLabel];
  [v10 setText:v9];

  uint64_t v11 = _stringValueForPropertyDictionary(v8);
  uint64_t v12 = [v7 detailTextLabel];
  [v12 setText:v11];

  return v7;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  return sel_copy_ == a4;
}

- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  id v17 = a3;
  id v11 = a5;
  id v12 = a6;
  if (sel_copy_ != a4)
  {
    int v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"CertInfoCertificateDetailsController.m" lineNumber:248 description:@"can only perform copy:"];
  }
  v13 = [(CertInfoCertificateDetailsController *)self _propertiesForIndexPath:v11];
  objc_super v14 = _stringValueForPropertyDictionary(v13);

  if (v14)
  {
    v15 = [MEMORY[0x263F1C840] generalPasteboard];
    [v15 setString:v14];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
}

- (id)_propertiesForIndexPath:(id)a3
{
  sectionDictionaries = self->_sectionDictionaries;
  id v4 = a3;
  char v5 = -[NSArray objectAtIndex:](sectionDictionaries, "objectAtIndex:", [v4 section]);
  id v6 = [v5 objectForKey:@"CertInfoCertificateDetailsSectionPropertiesKey"];
  uint64_t v7 = [v4 row];

  uint64_t v8 = [v6 objectAtIndex:v7];

  return v8;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (CertInfoCertificateDetailsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CertInfoCertificateDetailsControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_sectionDictionaries, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end