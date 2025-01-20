@interface HSBook
+ (BOOL)supportsSecureCoding;
- (BOOL)isVPPLicensed;
- (HSBook)initWithCoder:(id)a3;
- (NSDate)datePurchased;
- (NSString)author;
- (NSString)genre;
- (NSString)redownloadParameters;
- (NSString)title;
- (NSString)vppOrganizationDisplayName;
- (NSString)vppOrganizationID;
- (NSURL)artworkURL;
- (id)description;
- (unint64_t)purchaseHistoryID;
- (unint64_t)storeID;
- (void)encodeWithCoder:(id)a3;
- (void)setArtworkURL:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setDatePurchased:(id)a3;
- (void)setGenre:(id)a3;
- (void)setPurchaseHistoryID:(unint64_t)a3;
- (void)setRedownloadParameters:(id)a3;
- (void)setStoreID:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)setVppLicensed:(BOOL)a3;
- (void)setVppOrganizationDisplayName:(id)a3;
- (void)setVppOrganizationID:(id)a3;
@end

@implementation HSBook

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vppOrganizationDisplayName, 0);
  objc_storeStrong((id *)&self->_vppOrganizationID, 0);
  objc_storeStrong((id *)&self->_redownloadParameters, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_datePurchased, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setVppOrganizationDisplayName:(id)a3
{
}

- (NSString)vppOrganizationDisplayName
{
  return self->_vppOrganizationDisplayName;
}

- (void)setVppOrganizationID:(id)a3
{
}

- (NSString)vppOrganizationID
{
  return self->_vppOrganizationID;
}

- (void)setVppLicensed:(BOOL)a3
{
  self->_vppLicensed = a3;
}

- (BOOL)isVPPLicensed
{
  return self->_vppLicensed;
}

- (void)setRedownloadParameters:(id)a3
{
}

- (NSString)redownloadParameters
{
  return self->_redownloadParameters;
}

- (void)setArtworkURL:(id)a3
{
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setDatePurchased:(id)a3
{
}

- (NSDate)datePurchased
{
  return self->_datePurchased;
}

- (void)setGenre:(id)a3
{
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setAuthor:(id)a3
{
}

- (NSString)author
{
  return self->_author;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setStoreID:(unint64_t)a3
{
  self->_storeID = a3;
}

- (unint64_t)storeID
{
  return self->_storeID;
}

- (void)setPurchaseHistoryID:(unint64_t)a3
{
  self->_purchaseHistoryID = a3;
}

- (unint64_t)purchaseHistoryID
{
  return self->_purchaseHistoryID;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HSBook *)self title];
  v6 = [v3 stringWithFormat:@"<%@: %p title='%@'>", v4, self, v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[HSBook purchaseHistoryID](self, "purchaseHistoryID"), @"HSPurchasedBookPurchaseHistoryID");
  objc_msgSend(v4, "encodeInt64:forKey:", -[HSBook storeID](self, "storeID"), @"HSPurchasedBookStoreID");
  v5 = [(HSBook *)self title];
  [v4 encodeObject:v5 forKey:@"HSPurchasedBookTitle"];

  v6 = [(HSBook *)self author];
  [v4 encodeObject:v6 forKey:@"HSPurchasedBookAuthor"];

  v7 = [(HSBook *)self genre];
  [v4 encodeObject:v7 forKey:@"HSPurchasedBookGenre"];

  v8 = [(HSBook *)self datePurchased];
  [v4 encodeObject:v8 forKey:@"HSPurchasedBookDatePurchased"];

  v9 = [(HSBook *)self artworkURL];
  [v4 encodeObject:v9 forKey:@"HSPurchasedBookArtworkURL"];

  v10 = [(HSBook *)self redownloadParameters];
  [v4 encodeObject:v10 forKey:@"HSPurchasedBookRedownloadParameters"];

  objc_msgSend(v4, "encodeBool:forKey:", -[HSBook isVPPLicensed](self, "isVPPLicensed"), @"HSPurchasedBookVPPLicensed");
  v11 = [(HSBook *)self vppOrganizationID];
  [v4 encodeObject:v11 forKey:@"HSPurchasedBookVPPOrganizationID"];

  id v12 = [(HSBook *)self vppOrganizationDisplayName];
  [v4 encodeObject:v12 forKey:@"HSPurchasedBookVPPOrganizationDisplayName"];
}

- (HSBook)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HSBook;
  v5 = [(HSBook *)&v15 init];
  if (v5)
  {
    -[HSBook setPurchaseHistoryID:](v5, "setPurchaseHistoryID:", [v4 decodeInt64ForKey:@"HSPurchasedBookPurchaseHistoryID"]);
    -[HSBook setStoreID:](v5, "setStoreID:", [v4 decodeInt64ForKey:@"HSPurchasedBookStoreID"]);
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HSPurchasedBookTitle"];
    [(HSBook *)v5 setTitle:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HSPurchasedBookAuthor"];
    [(HSBook *)v5 setAuthor:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HSPurchasedBookGenre"];
    [(HSBook *)v5 setGenre:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HSPurchasedBookDatePurchased"];
    [(HSBook *)v5 setDatePurchased:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HSPurchasedBookArtworkURL"];
    [(HSBook *)v5 setArtworkURL:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HSPurchasedBookRedownloadParameters"];
    [(HSBook *)v5 setRedownloadParameters:v11];

    -[HSBook setVppLicensed:](v5, "setVppLicensed:", [v4 decodeBoolForKey:@"HSPurchasedBookVPPLicensed"]);
    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HSPurchasedBookVPPOrganizationID"];
    [(HSBook *)v5 setVppOrganizationID:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HSPurchasedBookVPPOrganizationDisplayName"];
    [(HSBook *)v5 setVppOrganizationDisplayName:v13];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end