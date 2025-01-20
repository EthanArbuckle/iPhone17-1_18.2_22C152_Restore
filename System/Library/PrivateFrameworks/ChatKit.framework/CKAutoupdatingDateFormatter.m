@interface CKAutoupdatingDateFormatter
- (CKAutoupdatingDateFormatter)initWithTemplate:(id)a3;
- (NSString)template;
- (id)notificationCenter;
- (void)dealloc;
- (void)setTemplate:(id)a3;
- (void)updateDateFormat;
@end

@implementation CKAutoupdatingDateFormatter

- (void)dealloc
{
  v3 = [(CKAutoupdatingDateFormatter *)self notificationCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKAutoupdatingDateFormatter;
  [(CKAutoupdatingDateFormatter *)&v4 dealloc];
}

- (CKAutoupdatingDateFormatter)initWithTemplate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKAutoupdatingDateFormatter;
  v5 = [(CKAutoupdatingDateFormatter *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(CKAutoupdatingDateFormatter *)v5 setTemplate:v4];
    v7 = objc_msgSend(MEMORY[0x1E4F1CA20], "__ck_currentLocale");
    [(CKAutoupdatingDateFormatter *)v6 setLocale:v7];

    v8 = [(CKAutoupdatingDateFormatter *)v6 notificationCenter];
    [v8 addObserver:v6 selector:sel_updateDateFormat name:*MEMORY[0x1E4F1C370] object:0];

    [(CKAutoupdatingDateFormatter *)v6 updateDateFormat];
  }

  return v6;
}

- (id)notificationCenter
{
  return (id)[MEMORY[0x1E4F28EB8] defaultCenter];
}

- (void)updateDateFormat
{
  v3 = (void *)MEMORY[0x1E4F28C10];
  id v4 = [(CKAutoupdatingDateFormatter *)self template];
  v5 = [(CKAutoupdatingDateFormatter *)self locale];
  id v6 = [v3 dateFormatFromTemplate:v4 options:0 locale:v5];

  [(CKAutoupdatingDateFormatter *)self setDateFormat:v6];
}

- (NSString)template
{
  return self->_template;
}

- (void)setTemplate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end