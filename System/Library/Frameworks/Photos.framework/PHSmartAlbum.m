@interface PHSmartAlbum
+ (id)_collectionSubtypeExpressionForFetchRequests;
+ (id)albumKindFromSmartAlbumSubtype:(int64_t)a3;
+ (id)fetchPredicateFromComparisonPredicate:(id)a3 options:(id)a4;
+ (id)fetchType;
+ (id)managedEntityName;
- (BOOL)collectionHasFixedOrder;
@end

@implementation PHSmartAlbum

+ (id)managedEntityName
{
  return @"FetchingAlbum";
}

+ (id)albumKindFromSmartAlbumSubtype:(int64_t)a3
{
  switch(a3)
  {
    case 201:
      id result = &unk_1EEB24978;
      break;
    case 202:
      id result = &unk_1EEB249A8;
      break;
    case 203:
      id result = &unk_1EEB249C0;
      break;
    case 204:
      id result = &unk_1EEB249F0;
      break;
    case 205:
      id result = &unk_1EEB24A38;
      break;
    case 206:
      id result = &unk_1EEB24A50;
      break;
    case 207:
      id result = &unk_1EEB24A80;
      break;
    case 208:
      id result = &unk_1EEB249D8;
      break;
    case 209:
      id result = &unk_1EEB24A68;
      break;
    case 210:
      id result = &unk_1EEB24A08;
      break;
    case 211:
      id result = &unk_1EEB24A20;
      break;
    case 212:
      id result = &unk_1EEB24A98;
      break;
    case 213:
      id result = &unk_1EEB24AB0;
      break;
    case 214:
      id result = &unk_1EEB24AC8;
      break;
    case 215:
      id result = &unk_1EEB24AE0;
      break;
    case 216:
      id result = &unk_1EEB24B10;
      break;
    case 217:
      id result = &unk_1EEB24B70;
      break;
    case 218:
      id result = &unk_1EEB24B88;
      break;
    case 219:
      id result = &unk_1EEB24990;
      break;
    default:
      id result = 0;
      switch(a3)
      {
        case 1000000201:
          id result = &unk_1EEB24BE8;
          break;
        case 1000000203:
          id result = &unk_1EEB24C00;
          break;
        case 1000000204:
          id result = &unk_1EEB24AF8;
          break;
        case 1000000205:
          id result = &unk_1EEB24BD0;
          break;
        case 1000000206:
          id result = &unk_1EEB24B28;
          break;
        case 1000000207:
          id result = &unk_1EEB24B40;
          break;
        case 1000000211:
          id result = &unk_1EEB24BB8;
          break;
        case 1000000212:
          id result = &unk_1EEB24C18;
          break;
        case 1000000214:
          id result = &unk_1EEB24B58;
          break;
        case 1000000215:
          id result = &unk_1EEB24BA0;
          break;
        case 1000000218:
          id result = &unk_1EEB24C30;
          break;
        case 1000000219:
          id result = &unk_1EEB24C48;
          break;
        default:
          return result;
      }
      break;
  }
  return result;
}

+ (id)fetchPredicateFromComparisonPredicate:(id)a3 options:(id)a4
{
  id v6 = a3;
  v29.receiver = a1;
  v29.super_class = (Class)&OBJC_METACLASS___PHSmartAlbum;
  v7 = objc_msgSendSuper2(&v29, sel_fetchPredicateFromComparisonPredicate_options_, v6, a4);
  if (!v7)
  {
    v8 = [v6 leftExpression];
    v9 = [v6 rightExpression];
    uint64_t v10 = [v8 expressionType];
    if (v10 == 3) {
      v11 = v8;
    }
    else {
      v11 = v9;
    }
    v12 = [v11 keyPath];
    if ([v12 isEqualToString:@"assetCollectionSubtype"])
    {
      if (v10 == 3) {
        v13 = v9;
      }
      else {
        v13 = v8;
      }
      v14 = [v13 constantValue];
      uint64_t v27 = [a1 _collectionSubtypeExpressionForFetchRequests];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __62__PHSmartAlbum_fetchPredicateFromComparisonPredicate_options___block_invoke;
      v28[3] = &__block_descriptor_40_e8__16__0_8l;
      v28[4] = a1;
      v26 = v14;
      v15 = PHQueryTransformExpressionConstantValue(v14, v28);
      v16 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v15];
      id v17 = objc_alloc(MEMORY[0x1E4F28B98]);
      uint64_t v18 = [v6 comparisonPredicateModifier];
      uint64_t v19 = [v6 predicateOperatorType];
      uint64_t v20 = [v6 options];
      v21 = v17;
      if (v10 == 3)
      {
        v22 = (void *)v27;
        v23 = (void *)v27;
        v24 = v16;
      }
      else
      {
        v23 = v16;
        v22 = (void *)v27;
        v24 = (void *)v27;
      }
      v7 = (void *)[v21 initWithLeftExpression:v23 rightExpression:v24 modifier:v18 type:v19 options:v20];
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

uint64_t __62__PHSmartAlbum_fetchPredicateFromComparisonPredicate_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 integerValue];
  v4 = *(void **)(a1 + 32);

  return [v4 albumKindFromSmartAlbumSubtype:v3];
}

+ (id)fetchType
{
  v2 = @"PHSmartAlbum";
  return @"PHSmartAlbum";
}

+ (id)_collectionSubtypeExpressionForFetchRequests
{
  return (id)[MEMORY[0x1E4F28C68] expressionForKeyPath:@"kind"];
}

- (BOOL)collectionHasFixedOrder
{
  return 1;
}

@end