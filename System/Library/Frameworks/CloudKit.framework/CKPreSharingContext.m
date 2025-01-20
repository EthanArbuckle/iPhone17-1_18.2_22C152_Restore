@interface CKPreSharingContext
+ (BOOL)supportsSecureCoding;
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
- (CKPreSharingContext)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKPreSharingContext

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.cloudkit.sharingsupport.pre";
  v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)v4, 1);

  return (NSArray *)v2;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  v10 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v6, v9, v8, (uint64_t)v7, a5);

  return v10;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.cloudkit.sharingsupport.pre";
  v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)v4, 1);

  return (NSArray *)v2;
}

- (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3
{
  return 0;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  v5 = (void (**)(id, void *, id))a4;
  id v10 = 0;
  id v7 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v6, (uint64_t)self, 1, &v10);
  id v8 = v10;
  if (v5) {
    v5[2](v5, v7, v8);
  }

  return 0;
}

- (CKPreSharingContext)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKPreSharingContext;
  return [(CKSharingContext *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKPreSharingContext;
  [(CKSharingContext *)&v3 encodeWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKPreSharingContext;
  return [(CKSharingContext *)&v4 copyWithZone:a3];
}

@end