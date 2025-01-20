@interface CPSContactEntityViewController
- (BOOL)buttonsShouldFill;
- (CPSActionsViewController)actionsController;
- (CPSAvatarViewController)avatarViewController;
- (CPSContactEntityViewController)initWithEntity:(id)a3 resourceProvider:(id)a4;
- (CPSNameViewController)nameViewController;
- (NSArray)layoutConstraints;
- (UILayoutGuide)avatarAndDetailsLayoutGuide;
- (UILayoutGuide)centeringLayoutGuide;
- (id)personEntity;
- (void)configureButton:(id)a3;
- (void)didUpdateEntity:(id)a3;
- (void)resetLayoutConstraints;
- (void)setAvatarAndDetailsLayoutGuide:(id)a3;
- (void)setCenteringLayoutGuide:(id)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setupLayoutConstraints;
- (void)setupLayoutGuides;
- (void)setupViewControllers;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidLoad;
@end

@implementation CPSContactEntityViewController

- (CPSContactEntityViewController)initWithEntity:(id)a3 resourceProvider:(id)a4
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  v4 = v21;
  v21 = 0;
  v18.receiver = v4;
  v18.super_class = (Class)CPSContactEntityViewController;
  v17 = [(CPSBaseEntityContentViewController *)&v18 initWithEntity:location[0] resourceProvider:v19];
  v21 = v17;
  objc_storeStrong((id *)&v21, v17);
  if (v17)
  {
    v5 = [CPSAvatarViewController alloc];
    uint64_t v6 = [(CPSAvatarViewController *)v5 initWithEntity:location[0]];
    avatarViewController = v21->_avatarViewController;
    v21->_avatarViewController = (CPSAvatarViewController *)v6;

    v8 = [CPSNameViewController alloc];
    uint64_t v9 = [(CPSNameViewController *)v8 initWithEntity:location[0]];
    nameViewController = v21->_nameViewController;
    v21->_nameViewController = (CPSNameViewController *)v9;

    v11 = [CPSActionsViewController alloc];
    uint64_t v12 = [(CPSActionsViewController *)v11 initWithEntity:location[0] layoutDelete:v21];
    actionsController = v21->_actionsController;
    v21->_actionsController = (CPSActionsViewController *)v12;

    [(CPSActionsViewController *)v21->_actionsController setEventDelegate:v21];
  }
  v15 = v21;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v21, 0);
  return v15;
}

- (id)personEntity
{
  return [(CPSBaseEntityContentViewController *)self entity];
}

- (void)didUpdateEntity:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9.receiver = v11;
  v9.super_class = (Class)CPSContactEntityViewController;
  [(CPSBaseEntityContentViewController *)&v9 didUpdateEntity:location[0]];
  avatarViewController = v11->_avatarViewController;
  v4 = [(CPSBaseEntityContentViewController *)v11 entity];
  -[CPSAvatarViewController updateWithEntity:](avatarViewController, "updateWithEntity:");

  nameViewController = v11->_nameViewController;
  uint64_t v6 = [(CPSBaseEntityContentViewController *)v11 entity];
  -[CPSNameViewController updateWithEntity:](nameViewController, "updateWithEntity:");

  actionsController = v11->_actionsController;
  v8 = [(CPSBaseEntityContentViewController *)v11 entity];
  -[CPSActionsViewController updateWithEntity:](actionsController, "updateWithEntity:");

  objc_storeStrong(location, 0);
}

- (void)viewDidLoad
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSContactEntityViewController;
  [(CPSContactEntityViewController *)&v2 viewDidLoad];
  [(CPSContactEntityViewController *)v4 setupViewControllers];
}

- (void)setupViewControllers
{
  v21[3] = *MEMORY[0x263EF8340];
  id v19 = self;
  location[1] = (id)a2;
  id v10 = (id)[MEMORY[0x263F1C550] tableBackgroundColor];
  id v9 = (id)[(CPSContactEntityViewController *)v19 view];
  [v9 setBackgroundColor:v10];

  v13 = [(CPSContactEntityViewController *)v19 avatarViewController];
  v21[0] = v13;
  uint64_t v12 = [(CPSContactEntityViewController *)v19 nameViewController];
  v21[1] = v12;
  v11 = [(CPSContactEntityViewController *)v19 actionsController];
  v21[2] = v11;
  location[0] = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];

  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v15 = [obj countByEnumeratingWithState:__b objects:v20 count:16];
  if (v15)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0;
    unint64_t v8 = v15;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      id v17 = *(id *)(__b[1] + 8 * v7);
      id v2 = (id)[v17 view];
      [v2 setTranslatesAutoresizingMaskIntoConstraints:0];

      [v17 willMoveToParentViewController:v19];
      [(CPSContactEntityViewController *)v19 addChildViewController:v17];
      id v4 = (id)[(CPSContactEntityViewController *)v19 view];
      id v3 = (id)[v17 view];
      objc_msgSend(v4, "addSubview:");

      [v17 didMoveToParentViewController:v19];
      ++v7;
      if (v5 + 1 >= v8)
      {
        uint64_t v7 = 0;
        unint64_t v8 = [obj countByEnumeratingWithState:__b objects:v20 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  objc_storeStrong(location, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSContactEntityViewController;
  [(CPSContactEntityViewController *)&v3 traitCollectionDidChange:location[0]];
  [(CPSContactEntityViewController *)v5 resetLayoutConstraints];
  objc_storeStrong(location, 0);
}

- (void)resetLayoutConstraints
{
  uint64_t v5 = [(CPSContactEntityViewController *)self layoutConstraints];
  uint64_t v6 = [(NSArray *)v5 count];

  if (v6)
  {
    id v2 = (void *)MEMORY[0x263F08938];
    objc_super v3 = [(CPSContactEntityViewController *)self layoutConstraints];
    objc_msgSend(v2, "deactivateConstraints:");

    [(CPSContactEntityViewController *)self setLayoutConstraints:0];
    id v4 = (id)[(CPSContactEntityViewController *)self view];
    [v4 setNeedsUpdateConstraints];
  }
}

- (void)updateViewConstraints
{
  uint64_t v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CPSContactEntityViewController;
  [(CPSContactEntityViewController *)&v4 updateViewConstraints];
  id v2 = [(CPSContactEntityViewController *)v6 layoutConstraints];
  BOOL v3 = [(NSArray *)v2 count] != 0;

  if (!v3)
  {
    [(CPSContactEntityViewController *)v6 setupLayoutGuides];
    [(CPSContactEntityViewController *)v6 setupLayoutConstraints];
  }
}

- (void)setupLayoutConstraints
{
  v134[4] = *MEMORY[0x263EF8340];
  v129 = self;
  v128[1] = (id)a2;
  v128[0] = (id)objc_opt_new();
  v25 = [(CPSContactEntityViewController *)v129 centeringLayoutGuide];
  v24 = [(UILayoutGuide *)v25 topAnchor];
  id v23 = (id)[(CPSContactEntityViewController *)v129 view];
  id v22 = (id)[v23 safeAreaLayoutGuide];
  id v21 = (id)[v22 topAnchor];
  id v20 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v24, "constraintEqualToAnchor:");
  v134[0] = v20;
  id v19 = [(CPSContactEntityViewController *)v129 centeringLayoutGuide];
  objc_super v18 = [(UILayoutGuide *)v19 bottomAnchor];
  id v17 = [(CPSContactEntityViewController *)v129 actionsController];
  id v16 = (id)[(CPSActionsViewController *)v17 view];
  id v15 = (id)[v16 topAnchor];
  id v14 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v18, "constraintEqualToAnchor:");
  v134[1] = v14;
  v13 = [(CPSContactEntityViewController *)v129 centeringLayoutGuide];
  uint64_t v12 = [(UILayoutGuide *)v13 leftAnchor];
  id v11 = (id)[(CPSContactEntityViewController *)v129 view];
  id v10 = (id)[v11 safeAreaLayoutGuide];
  id v9 = (id)[v10 leftAnchor];
  id v8 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v12, "constraintEqualToAnchor:");
  v134[2] = v8;
  uint64_t v7 = [(CPSContactEntityViewController *)v129 centeringLayoutGuide];
  uint64_t v6 = [(UILayoutGuide *)v7 rightAnchor];
  id v5 = (id)[(CPSContactEntityViewController *)v129 view];
  id v4 = (id)[v5 safeAreaLayoutGuide];
  id v3 = (id)[v4 rightAnchor];
  id v2 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v6, "constraintEqualToAnchor:");
  v134[3] = v2;
  id v127 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v134);

  v55 = [(CPSContactEntityViewController *)v129 avatarAndDetailsLayoutGuide];
  v54 = [(UILayoutGuide *)v55 centerYAnchor];
  v53 = [(CPSContactEntityViewController *)v129 centeringLayoutGuide];
  v52 = [(UILayoutGuide *)v53 centerYAnchor];
  id v51 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v54, "constraintEqualToAnchor:");
  v133[0] = v51;
  v50 = [(CPSContactEntityViewController *)v129 avatarAndDetailsLayoutGuide];
  v49 = [(UILayoutGuide *)v50 centerXAnchor];
  v48 = [(CPSContactEntityViewController *)v129 centeringLayoutGuide];
  v47 = [(UILayoutGuide *)v48 centerXAnchor];
  id v46 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v49, "constraintEqualToAnchor:");
  v133[1] = v46;
  v45 = [(CPSContactEntityViewController *)v129 avatarAndDetailsLayoutGuide];
  v44 = [(UILayoutGuide *)v45 leftAnchor];
  v43 = [(CPSContactEntityViewController *)v129 centeringLayoutGuide];
  v42 = [(UILayoutGuide *)v43 leftAnchor];
  id v41 = (id)-[NSLayoutXAxisAnchor constraintGreaterThanOrEqualToAnchor:](v44, "constraintGreaterThanOrEqualToAnchor:");
  v133[2] = v41;
  v40 = [(CPSContactEntityViewController *)v129 avatarAndDetailsLayoutGuide];
  v39 = [(UILayoutGuide *)v40 rightAnchor];
  v38 = [(CPSContactEntityViewController *)v129 centeringLayoutGuide];
  v37 = [(UILayoutGuide *)v38 rightAnchor];
  id v36 = (id)-[NSLayoutXAxisAnchor constraintLessThanOrEqualToAnchor:](v39, "constraintLessThanOrEqualToAnchor:");
  v133[3] = v36;
  v35 = [(CPSContactEntityViewController *)v129 avatarAndDetailsLayoutGuide];
  v34 = [(UILayoutGuide *)v35 topAnchor];
  v33 = [(CPSContactEntityViewController *)v129 centeringLayoutGuide];
  v32 = [(UILayoutGuide *)v33 topAnchor];
  id v31 = (id)-[NSLayoutYAxisAnchor constraintGreaterThanOrEqualToAnchor:](v34, "constraintGreaterThanOrEqualToAnchor:");
  v133[4] = v31;
  v30 = [(CPSContactEntityViewController *)v129 avatarAndDetailsLayoutGuide];
  v29 = [(UILayoutGuide *)v30 bottomAnchor];
  v28 = [(CPSContactEntityViewController *)v129 centeringLayoutGuide];
  v27 = [(UILayoutGuide *)v28 bottomAnchor];
  id v26 = (id)-[NSLayoutYAxisAnchor constraintLessThanOrEqualToAnchor:](v29, "constraintLessThanOrEqualToAnchor:");
  v133[5] = v26;
  id v126 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v133 count:6];

  v80 = [(CPSContactEntityViewController *)v129 actionsController];
  id v79 = (id)[(CPSActionsViewController *)v80 view];
  id v78 = (id)[v79 leadingAnchor];
  id v77 = (id)[(CPSContactEntityViewController *)v129 view];
  id v76 = (id)[v77 safeAreaLayoutGuide];
  id v75 = (id)[v76 leadingAnchor];
  id v74 = (id)objc_msgSend(v78, "constraintEqualToAnchor:");
  v132[0] = v74;
  v73 = [(CPSContactEntityViewController *)v129 actionsController];
  id v72 = (id)[(CPSActionsViewController *)v73 view];
  id v71 = (id)[v72 trailingAnchor];
  id v70 = (id)[(CPSContactEntityViewController *)v129 view];
  id v69 = (id)[v70 safeAreaLayoutGuide];
  id v68 = (id)[v69 trailingAnchor];
  id v67 = (id)objc_msgSend(v71, "constraintEqualToAnchor:");
  v132[1] = v67;
  v66 = [(CPSContactEntityViewController *)v129 actionsController];
  id v65 = (id)[(CPSActionsViewController *)v66 view];
  id v64 = (id)[v65 bottomAnchor];
  id v63 = (id)[(CPSContactEntityViewController *)v129 view];
  id v62 = (id)[v63 safeAreaLayoutGuide];
  id v61 = (id)[v62 bottomAnchor];
  id v60 = (id)objc_msgSend(v64, "constraintEqualToAnchor:constant:", -12.0);
  v132[2] = v60;
  v59 = [(CPSContactEntityViewController *)v129 actionsController];
  id v58 = (id)[(CPSActionsViewController *)v59 view];
  id v57 = (id)[v58 heightAnchor];
  id v56 = (id)[v57 constraintEqualToConstant:69.0];
  v132[3] = v56;
  id v125 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v132 count:4];

  v99 = [(CPSContactEntityViewController *)v129 nameViewController];
  id v98 = (id)[(CPSNameViewController *)v99 view];
  id v97 = (id)[v98 centerYAnchor];
  v96 = [(CPSContactEntityViewController *)v129 avatarAndDetailsLayoutGuide];
  v95 = [(UILayoutGuide *)v96 centerYAnchor];
  id v94 = (id)objc_msgSend(v97, "constraintEqualToAnchor:");
  v131[0] = v94;
  v93 = [(CPSContactEntityViewController *)v129 nameViewController];
  id v92 = (id)[(CPSNameViewController *)v93 view];
  id v91 = (id)[v92 leadingAnchor];
  v90 = [(CPSContactEntityViewController *)v129 avatarViewController];
  id v89 = (id)[(CPSAvatarViewController *)v90 view];
  id v88 = (id)[v89 trailingAnchor];
  id v87 = (id)objc_msgSend(v91, "constraintEqualToAnchor:constant:", 12.0);
  v131[1] = v87;
  v86 = [(CPSContactEntityViewController *)v129 nameViewController];
  id v85 = (id)[(CPSNameViewController *)v86 view];
  id v84 = (id)[v85 trailingAnchor];
  v83 = [(CPSContactEntityViewController *)v129 avatarAndDetailsLayoutGuide];
  v82 = [(UILayoutGuide *)v83 trailingAnchor];
  id v81 = (id)objc_msgSend(v84, "constraintEqualToAnchor:");
  v131[2] = v81;
  id v124 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v131 count:3];

  v119 = [(CPSContactEntityViewController *)v129 avatarViewController];
  id v118 = (id)[(CPSAvatarViewController *)v119 view];
  id v117 = (id)[v118 centerYAnchor];
  v116 = [(CPSContactEntityViewController *)v129 avatarAndDetailsLayoutGuide];
  v115 = [(UILayoutGuide *)v116 centerYAnchor];
  id v114 = (id)objc_msgSend(v117, "constraintEqualToAnchor:");
  v130[0] = v114;
  v113 = [(CPSContactEntityViewController *)v129 avatarViewController];
  id v112 = (id)[(CPSAvatarViewController *)v113 view];
  id v111 = (id)[v112 leadingAnchor];
  v110 = [(CPSContactEntityViewController *)v129 avatarAndDetailsLayoutGuide];
  v109 = [(UILayoutGuide *)v110 leadingAnchor];
  id v108 = (id)objc_msgSend(v111, "constraintEqualToAnchor:");
  v130[1] = v108;
  v107 = [(CPSContactEntityViewController *)v129 avatarViewController];
  id v106 = (id)[(CPSAvatarViewController *)v107 view];
  id v105 = (id)[v106 widthAnchor];
  id v104 = (id)[v105 constraintEqualToConstant:*(double *)&CPSAvatarSize];
  v130[2] = v104;
  v103 = [(CPSContactEntityViewController *)v129 avatarViewController];
  id v102 = (id)[(CPSAvatarViewController *)v103 view];
  id v101 = (id)[v102 heightAnchor];
  id v100 = (id)[v101 constraintEqualToConstant:*(double *)&CPSAvatarSize];
  v130[3] = v100;
  id v123 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v130 count:4];

  [v128[0] addObjectsFromArray:v127];
  [v128[0] addObjectsFromArray:v126];
  [v128[0] addObjectsFromArray:v123];
  [v128[0] addObjectsFromArray:v124];
  [v128[0] addObjectsFromArray:v125];
  id v120 = (id)[v128[0] copy];
  [(CPSContactEntityViewController *)v129 setLayoutConstraints:"setLayoutConstraints:"];

  v121 = (void *)MEMORY[0x263F08938];
  v122 = [(CPSContactEntityViewController *)v129 layoutConstraints];
  objc_msgSend(v121, "activateConstraints:");

  objc_storeStrong(&v123, 0);
  objc_storeStrong(&v124, 0);
  objc_storeStrong(&v125, 0);
  objc_storeStrong(&v126, 0);
  objc_storeStrong(&v127, 0);
  objc_storeStrong(v128, 0);
}

- (void)setupLayoutGuides
{
  uint64_t v6 = self;
  v5[1] = (id)a2;
  v5[0] = objc_alloc_init(MEMORY[0x263F1C778]);
  id v2 = (id)[(CPSContactEntityViewController *)v6 view];
  [v2 addLayoutGuide:v5[0]];

  [(CPSContactEntityViewController *)v6 setCenteringLayoutGuide:v5[0]];
  id v4 = objc_alloc_init(MEMORY[0x263F1C778]);
  id v3 = (id)[(CPSContactEntityViewController *)v6 view];
  [v3 addLayoutGuide:v4];

  [(CPSContactEntityViewController *)v6 setAvatarAndDetailsLayoutGuide:v4];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(v5, 0);
}

- (BOOL)buttonsShouldFill
{
  return 1;
}

- (void)configureButton:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = location[0];
  id v4 = (id)[MEMORY[0x263F1C550] _carSystemFocusColor];
  objc_msgSend(v3, "setTitleColor:forState:");

  objc_storeStrong(location, 0);
}

- (CPSAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (CPSNameViewController)nameViewController
{
  return self->_nameViewController;
}

- (CPSActionsViewController)actionsController
{
  return self->_actionsController;
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
}

- (UILayoutGuide)centeringLayoutGuide
{
  return self->_centeringLayoutGuide;
}

- (void)setCenteringLayoutGuide:(id)a3
{
}

- (UILayoutGuide)avatarAndDetailsLayoutGuide
{
  return self->_avatarAndDetailsLayoutGuide;
}

- (void)setAvatarAndDetailsLayoutGuide:(id)a3
{
}

- (void).cxx_destruct
{
}

@end