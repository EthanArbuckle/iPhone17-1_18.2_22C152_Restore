@interface CertInfoTrustDetailsView
- (CertInfoTrustDetailsView)initWithFrame:(CGRect)a3 trustProperties:(id)a4;
- (void)_appendRemainingCertificates;
- (void)layoutSubviews;
@end

@implementation CertInfoTrustDetailsView

- (void)_appendRemainingCertificates
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_certificateViews;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        currentCertView = self->_currentCertView;
        if (*(CertInfoCertificateDetailsView **)(*((void *)&v9 + 1) + 8 * i) != currentCertView) {
          [(CertInfoCertificateDetailsView *)currentCertView appendInfoFromCertView:(void)v9];
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (CertInfoTrustDetailsView)initWithFrame:(CGRect)a3 trustProperties:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a4;
  v28.receiver = self;
  v28.super_class = (Class)CertInfoTrustDetailsView;
  long long v10 = -[CertInfoTrustDetailsView initWithFrame:](&v28, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    long long v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * v16);
          v18 = [CertInfoCertificateDetailsView alloc];
          v19 = -[CertInfoCertificateDetailsView initWithFrame:certificateProperties:](v18, "initWithFrame:certificateProperties:", v17, x, y, width, height, (void)v24);
          [v11 addObject:v19];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v14);
    }

    if ([v11 count]) {
      objc_storeStrong((id *)&v10->_certificateViews, v11);
    }
    uint64_t v20 = -[NSArray objectAtIndex:](v10->_certificateViews, "objectAtIndex:", 0, (void)v24);
    currentCertView = v10->_currentCertView;
    v10->_currentCertView = (CertInfoCertificateDetailsView *)v20;

    [(CertInfoTrustDetailsView *)v10 addSubview:v10->_currentCertView];
    [(CertInfoTrustDetailsView *)v10 _appendRemainingCertificates];
    v22 = [MEMORY[0x263F1C550] whiteColor];
    [(CertInfoTrustDetailsView *)v10 setBackgroundColor:v22];
  }
  return v10;
}

- (void)layoutSubviews
{
  [(CertInfoTrustDetailsView *)self bounds];
  currentCertView = self->_currentCertView;
  -[CertInfoCertificateDetailsView setFrame:](currentCertView, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCertView, 0);
  objc_storeStrong((id *)&self->_certificateViews, 0);
}

@end