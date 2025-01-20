@interface NSSet
- (BOOL)containsElementsNotIn:(id)a3;
- (BOOL)isEmpty;
- (id)logIDs;
- (id)logKeys;
- (id)shortDescription;
- (id)sortedElementsJoinedByString:(id)a3;
- (id)sortedElementsTruncated:(unint64_t)a3 JoinedByString:(id)a4;
@end

@implementation NSSet

- (id)logIDs
{
  return [(NSSet *)self sortedElementsTruncated:8 JoinedByString:@" "];
}

- (id)logKeys
{
  return [(NSSet *)self sortedElementsJoinedByString:@" "];
}

- (id)shortDescription
{
  v2 = [(NSSet *)self allObjects];
  v3 = [v2 sortedArrayUsingSelector:"compare:"];
  v4 = [v3 concatenateWithSeparator:@", "];
  v5 = +[NSString stringWithFormat:@"{[%@]}", v4];

  return v5;
}

- (id)sortedElementsTruncated:(unint64_t)a3 JoinedByString:(id)a4
{
  id v6 = a4;
  +[NSMutableArray array];
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_100010190;
  v13 = &unk_100019090;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v15 = a3;
  id v7 = v14;
  [(NSSet *)self enumerateObjectsUsingBlock:&v10];
  objc_msgSend(v7, "sortUsingSelector:", "compare:", v10, v11, v12, v13);
  v8 = [v7 componentsJoinedByString:v6];

  return v8;
}

- (id)sortedElementsJoinedByString:(id)a3
{
  return [(NSSet *)self sortedElementsTruncated:0 JoinedByString:a3];
}

- (BOOL)containsElementsNotIn:(id)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001034C;
  v6[3] = &unk_100019068;
  id v4 = a3;
  id v7 = v4;
  v8 = &v9;
  [(NSSet *)self enumerateObjectsUsingBlock:v6];
  LOBYTE(self) = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)self;
}

- (BOOL)isEmpty
{
  return [(NSSet *)self count] == 0;
}

@end