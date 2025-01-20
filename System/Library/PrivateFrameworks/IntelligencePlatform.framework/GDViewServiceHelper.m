@interface GDViewServiceHelper
+ (id)donationViewWithAccessAssertion:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)featureViewWithAccessAssertion:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)firstPartyLongTermTopicViewWithAccessAssertion:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)firstPartyShortTermTopicViewWithAccessAssertion:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)pageRankViewWithAccessAssertion:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)personViewWithAccessAssertion:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)visualIdentifierViewWithAccessAssertion:(id)a3 database:(id)a4 error:(id *)a5;
@end

@implementation GDViewServiceHelper

+ (id)firstPartyShortTermTopicViewWithAccessAssertion:(id)a3 database:(id)a4 error:(id *)a5
{
  id v6 = a4;
  id v7 = a3;
  v8 = [GDTopicView alloc];
  v11 = objc_msgSend_initWithAccessAssertion_database_(v8, v9, (uint64_t)v7, (uint64_t)v6, v10);

  return v11;
}

+ (id)firstPartyLongTermTopicViewWithAccessAssertion:(id)a3 database:(id)a4 error:(id *)a5
{
  id v6 = a4;
  id v7 = a3;
  v8 = [GDTopicView alloc];
  v11 = objc_msgSend_initWithAccessAssertion_database_(v8, v9, (uint64_t)v7, (uint64_t)v6, v10);

  return v11;
}

+ (id)featureViewWithAccessAssertion:(id)a3 database:(id)a4 error:(id *)a5
{
  id v6 = a4;
  id v7 = a3;
  v8 = [GDFeatureView alloc];
  v11 = objc_msgSend_initWithAccessAssertion_database_(v8, v9, (uint64_t)v7, (uint64_t)v6, v10);

  return v11;
}

+ (id)pageRankViewWithAccessAssertion:(id)a3 database:(id)a4 error:(id *)a5
{
  id v6 = a4;
  id v7 = a3;
  v8 = [GDPageRankView alloc];
  v11 = objc_msgSend_initWithAccessAssertion_database_(v8, v9, (uint64_t)v7, (uint64_t)v6, v10);

  return v11;
}

+ (id)donationViewWithAccessAssertion:(id)a3 database:(id)a4 error:(id *)a5
{
  id v6 = a4;
  id v7 = a3;
  v8 = [GDDonationView alloc];
  v11 = objc_msgSend_initWithAccessAssertion_database_(v8, v9, (uint64_t)v7, (uint64_t)v6, v10);

  return v11;
}

+ (id)visualIdentifierViewWithAccessAssertion:(id)a3 database:(id)a4 error:(id *)a5
{
  id v6 = a4;
  id v7 = a3;
  v8 = [GDVisualIdentifierView alloc];
  v11 = objc_msgSend_initWithAccessAssertion_database_(v8, v9, (uint64_t)v7, (uint64_t)v6, v10);

  return v11;
}

+ (id)personViewWithAccessAssertion:(id)a3 database:(id)a4 error:(id *)a5
{
  id v6 = a4;
  id v7 = a3;
  v8 = [GDPersonView alloc];
  v11 = objc_msgSend_initWithAccessAssertion_database_(v8, v9, (uint64_t)v7, (uint64_t)v6, v10);

  return v11;
}

@end