@interface GKCollectionViewFlowLayout
+ (Class)layoutAttributesClass;
- (GKCollectionViewFlowLayout)init;
- (GKCollectionViewFlowLayoutDelegate)delegate;
- (NSArray)podList;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (void)prepareLayout;
- (void)setDelegate:(id)a3;
- (void)setPodList:(id)a3;
@end

@implementation GKCollectionViewFlowLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (GKCollectionViewFlowLayout)init
{
  v4.receiver = self;
  v4.super_class = (Class)GKCollectionViewFlowLayout;
  v2 = [(GKCollectionViewFlowLayout *)&v4 init];
  if (v2) {
    [(GKCollectionViewFlowLayout *)v2 registerClass:objc_opt_class() forDecorationViewOfKind:@"sectionBackground"];
  }
  return v2;
}

- (void)prepareLayout
{
  v2.receiver = self;
  v2.super_class = (Class)GKCollectionViewFlowLayout;
  [(GKCollectionViewFlowLayout *)&v2 prepareLayout];
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  v82.receiver = self;
  v82.super_class = (Class)GKCollectionViewFlowLayout;
  objc_super v4 = -[GKCollectionViewFlowLayout layoutAttributesForElementsInRect:](&v82, "layoutAttributesForElementsInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v73 = +[NSMutableArray arrayWithArray:v4];
  v5 = +[NSMutableDictionary dictionary];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned int v7 = [WeakRetained isManagingBackgroundColor];

  if (v7)
  {
    v67 = v4;
    v68 = v5;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id obj = v4;
    id v8 = [obj countByEnumeratingWithState:&v78 objects:v84 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v79;
      uint64_t v70 = *(void *)v79;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v79 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v78 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "indexPath", v67);
          id v14 = [v13 section];
          v15 = [(GKCollectionViewFlowLayout *)self podList];
          id v16 = [v15 count];

          if (v14 < v16)
          {
            v17 = [(GKCollectionViewFlowLayout *)self podList];
            v18 = objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v13, "section"));

            if ([v18 viewCount])
            {
              v19 = [v18 viewAtIndex:0];
              if (([v19 isFullWidth] & 1) == 0)
              {
                v20 = [v12 representedElementKind];

                if (!v20)
                {
                  id v21 = [v13 section];
                  [v12 frame];
                  double MinY = CGRectGetMinY(v86);
                  [v12 frame];
                  double MaxY = CGRectGetMaxY(v87);
                  v24 = [v68 allKeys];
                  id v69 = v21;
                  v25 = +[NSNumber numberWithInteger:v21];
                  unsigned __int8 v26 = [v24 containsObject:v25];

                  if (v26)
                  {
                    v27 = +[NSNumber numberWithInteger:v69];
                    v28 = v68;
                    v29 = [v68 objectForKey:v27];

                    v30 = [v29 objectForKey:@"frameMinY"];
                    [v30 floatValue];
                    float v32 = v31;

                    v33 = [v29 objectForKey:@"frameMaxY"];
                    [v33 floatValue];
                    double v35 = v34;

                    if (MaxY > v35)
                    {
                      v36 = +[NSNumber numberWithDouble:MaxY];
                      [v29 setObject:v36 forKey:@"frameMaxY"];
                    }
                    if (MinY < v32)
                    {
                      v37 = +[NSNumber numberWithDouble:MinY];
                      [v29 setObject:v37 forKey:@"frameMinY"];
                    }
                  }
                  else
                  {
                    v29 = +[NSMutableDictionary dictionary];
                    [v29 setObject:v12 forKey:@"firstAttribute"];
                    v38 = +[NSNumber numberWithDouble:MinY];
                    [v29 setObject:v38 forKey:@"frameMinY"];

                    v39 = +[NSNumber numberWithDouble:MaxY];
                    [v29 setObject:v39 forKey:@"frameMaxY"];

                    [v29 setObject:v18 forKey:@"pod"];
                    v28 = v68;
                  }
                  v40 = +[NSNumber numberWithInteger:v69];
                  [v28 setObject:v29 forKey:v40];
                }
              }

              uint64_t v10 = v70;
            }
          }
        }
        id v9 = [obj countByEnumeratingWithState:&v78 objects:v84 count:16];
      }
      while (v9);
    }

    v5 = v68;
    objc_super v4 = v67;
    if ([v68 count])
    {
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id obja = [v68 allValues];
      id v41 = [obja countByEnumeratingWithState:&v74 objects:v83 count:16];
      if (v41)
      {
        id v42 = v41;
        uint64_t v43 = *(void *)v75;
        do
        {
          for (j = 0; j != v42; j = (char *)j + 1)
          {
            if (*(void *)v75 != v43) {
              objc_enumerationMutation(obja);
            }
            v45 = *(void **)(*((void *)&v74 + 1) + 8 * (void)j);
            v46 = objc_msgSend(v45, "objectForKey:", @"pod", v67);
            v47 = [v45 objectForKey:@"firstAttribute"];
            v48 = [v45 objectForKey:@"frameMinY"];
            [v48 floatValue];
            double v50 = v49;

            v51 = [v45 objectForKey:@"frameMaxY"];
            [v51 floatValue];
            double v53 = v52;

            v54 = [v47 indexPath];
            v55 = +[GKCollectionViewFlowLayoutAttributes layoutAttributesForDecorationViewOfKind:@"sectionBackground" withIndexPath:v54];

            v56 = [v46 footerView];
            [v46 edgeInsets];
            double v58 = v50 - v57;
            [(GKCollectionViewFlowLayout *)self collectionViewContentSize];
            double v60 = v59;
            [v46 edgeInsets];
            double v62 = v53 - v50 + v61;
            [v46 edgeInsets];
            double v64 = v62 + v63;
            [v56 frame];
            objc_msgSend(v55, "setFrame:", 0.0, v58, v60, v64 + v65);
            objc_msgSend(v55, "setZIndex:", (char *)objc_msgSend(v47, "zIndex") - 1);
            [v73 addObject:v55];
          }
          id v42 = [obja countByEnumeratingWithState:&v74 objects:v83 count:16];
        }
        while (v42);
      }

      objc_super v4 = v67;
      v5 = v68;
    }
  }

  return v73;
}

- (NSArray)podList
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_podList);

  return (NSArray *)WeakRetained;
}

- (void)setPodList:(id)a3
{
}

- (GKCollectionViewFlowLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKCollectionViewFlowLayoutDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_podList);
}

@end