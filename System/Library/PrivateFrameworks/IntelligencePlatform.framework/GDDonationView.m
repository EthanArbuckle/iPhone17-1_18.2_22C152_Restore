@interface GDDonationView
- (GDDonationView)initWithAccessAssertion:(id)a3 database:(id)a4;
- (void)enumerateTriples:(id)a3;
@end

@implementation GDDonationView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);

  objc_storeStrong((id *)&self->_accessAssertion, 0);
}

- (void)enumerateTriples:(id)a3
{
  id v4 = a3;
  db = self->_db;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B2E34BC4;
  v8[3] = &unk_1E6013670;
  id v9 = v4;
  id v6 = v4;
  objc_msgSend_prepQuery_onPrep_onError_(db, v7, @"SELECT * FROM donationSubgraph", (uint64_t)v8, 0);
}

- (GDDonationView)initWithAccessAssertion:(id)a3 database:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GDDonationView;
  id v9 = [(GDDonationView *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessAssertion, a3);
    objc_storeStrong((id *)&v10->_db, a4);
  }

  return v10;
}

@end