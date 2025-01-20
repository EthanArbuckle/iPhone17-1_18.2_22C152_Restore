@interface SGSignificantAddressModelForIMessage
+ (id)newTransformerInstanceForLanguage:(id)a3;
@end

@implementation SGSignificantAddressModelForIMessage

+ (id)newTransformerInstanceForLanguage:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v18 = +[SGTransformerInstance defaultWindowAndNgrams];
  v21 = +[SGTransformerInstance defaultSessionDescriptorForModelId:featureVersion:language:windowAndNgrams:](SGTransformerInstance, "defaultSessionDescriptorForModelId:featureVersion:language:windowAndNgrams:", @"SignificantPostalAddressForIMessage", @"1.5", v3);
  v4 = (void *)MEMORY[0x1E4F5DFC0];
  v20 = +[SGEntityMatchingTransformer withTargetMapping:@"SG_TARGET_ADDRESS" phoneMapping:@"SG_FEATURE_PHONENUMBER" emailMapping:@"SG_FEATURE_EMAIL" addressMapping:@"SG_FEATURE_ADDRESS" andDateMapping:@"SG_FEATURE_DATE"];
  v22[0] = v20;
  v19 = +[SGEntityMappingTransformer withEmailMapping:@"SG_FEATURE_EMAIL" linkMapping:@"SG_FEATURE_LINK"];
  v22[1] = v19;
  v5 = +[SGTokenizerMappingTransformer forLocale:v3 withPersonalNameMapping:@"SG_FEATURE_FULLNAME"];

  v22[2] = v5;
  v6 = +[SGNameMappingTransformer withFullNameMapping:@"SG_FEATURE_FULLNAME" firstNameMapping:@"SG_FEATURE_FIRSTNAME" lastNameMapping:@"SG_FEATURE_LASTNAME" andPossessive:@"SG_POSSESSIVE"];
  v22[3] = v6;
  v7 = +[SGSymbolicMappingTransformer withNumericMapping:@"SG_FEATURE_NUMBER" andSymbolicMapping:@"SG_FEATURE_SYMBOL"];
  v22[4] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:5];
  v9 = [v4 withTransformers:v8];
  v10 = +[SGConversationFlatteningTransformer withPerMessageTransformer:v9];
  v23[0] = v10;
  v11 = (void *)MEMORY[0x1E4F93808];
  v12 = [v18 second];
  v13 = objc_msgSend(v11, "withBucketSize:andNgrams:", 10000, objc_msgSend(v12, "intValue"));
  v23[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v15 = [v4 withTransformers:v14];

  v16 = [[SGTransformerInstance alloc] initWithTransformer:v15 sessionDescriptor:v21 modelClass:objc_opt_class()];
  return v16;
}

@end