@interface HKConceptSelection
+ (BOOL)supportsSecureCoding;
+ (id)andSelectionWithSubselections:(id)a3;
+ (id)notSelectionWithSubselections:(id)a3;
+ (id)orSelectionWithSubselections:(id)a3;
+ (id)selectionForAllNodes;
+ (id)selectionForNoNodes;
+ (id)selectionForNodeWithIdentifier:(id)a3;
+ (id)selectionForNodesWithAttribute:(int64_t)a3 likeStringValue:(id)a4;
+ (id)selectionForNodesWithAttribute:(int64_t)a3 stringValue:(id)a4;
+ (id)selectionForNodesWithAttribute:(int64_t)a3 value:(id)a4;
+ (id)selectionForNodesWithCoding:(id)a3;
+ (id)selectionForObjectsWithRelationship:(int64_t)a3 fromSubjectSelection:(id)a4;
+ (id)selectionForObjectsWithRelationshipFromSubjectSelection:(id)a3;
+ (id)selectionForSubjectsWithRelationship:(int64_t)a3 toObjectSelection:(id)a4;
+ (id)selectionForSubjectsWithRelationshipToObjectSelection:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HKConceptSelection)init;
- (HKConceptSelection)initWithCoder:(id)a3;
@end

@implementation HKConceptSelection

- (HKConceptSelection)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKConceptSelection;
  v2 = [(HKConceptSelection *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

+ (id)selectionForAllNodes
{
  v2 = [[HKAllConceptSelection alloc] initWithValue:1];

  return v2;
}

+ (id)selectionForNoNodes
{
  v2 = [[HKAllConceptSelection alloc] initWithValue:0];

  return v2;
}

+ (id)selectionForNodeWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [[HKIdentifierConceptSelection alloc] initWithIdentifier:v3];

  return v4;
}

+ (id)selectionForObjectsWithRelationshipFromSubjectSelection:(id)a3
{
  id v3 = a3;
  v4 = [[HKRelationshipConceptSelection alloc] initWithDirection:1 type:-1 selection:v3];

  return v4;
}

+ (id)selectionForSubjectsWithRelationshipToObjectSelection:(id)a3
{
  id v3 = a3;
  v4 = [[HKRelationshipConceptSelection alloc] initWithDirection:0 type:-1 selection:v3];

  return v4;
}

+ (id)selectionForObjectsWithRelationship:(int64_t)a3 fromSubjectSelection:(id)a4
{
  id v5 = a4;
  objc_super v6 = [[HKRelationshipConceptSelection alloc] initWithDirection:1 type:a3 selection:v5];

  return v6;
}

+ (id)selectionForSubjectsWithRelationship:(int64_t)a3 toObjectSelection:(id)a4
{
  id v5 = a4;
  objc_super v6 = [[HKRelationshipConceptSelection alloc] initWithDirection:0 type:a3 selection:v5];

  return v6;
}

+ (id)selectionForNodesWithAttribute:(int64_t)a3 value:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"HKConceptSelection.m", 85, @"Invalid parameter not satisfying: %@", @"value" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    +[HKConceptSelection selectionForNodesWithAttribute:value:]();
  }
  v8 = [[HKAttributeConceptSelection alloc] initWithAttribute:a3 operatorType:4 value:v7];

  return v8;
}

+ (id)selectionForNodesWithAttribute:(int64_t)a3 stringValue:(id)a4
{
  id v5 = a4;
  objc_super v6 = [[HKAttributeConceptSelection alloc] initWithAttribute:a3 operatorType:4 value:v5];

  return v6;
}

+ (id)selectionForNodesWithAttribute:(int64_t)a3 likeStringValue:(id)a4
{
  id v5 = a4;
  objc_super v6 = [[HKAttributeConceptSelection alloc] initWithAttribute:a3 operatorType:7 value:v5];

  return v6;
}

+ (id)selectionForNodesWithCoding:(id)a3
{
  id v3 = a3;
  v4 = [[HKMedicalCodingConceptSelection alloc] initWithMedicalCoding:v3];

  return v4;
}

+ (id)andSelectionWithSubselections:(id)a3
{
  id v3 = a3;
  v4 = [[HKCompoundConceptSelection alloc] initWithSelections:v3 operationType:1];

  return v4;
}

+ (id)orSelectionWithSubselections:(id)a3
{
  id v3 = a3;
  v4 = [[HKCompoundConceptSelection alloc] initWithSelections:v3 operationType:2];

  return v4;
}

+ (id)notSelectionWithSubselections:(id)a3
{
  id v3 = a3;
  v4 = [[HKCompoundConceptSelection alloc] initWithSelections:v3 operationType:0];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKConceptSelection)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HKConceptSelection;
  id v3 = [(HKConceptSelection *)&v7 init];
  v4 = v3;
  if (v3) {
    id v5 = v3;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

+ (void)selectionForNodesWithAttribute:value:.cold.1()
{
}

@end